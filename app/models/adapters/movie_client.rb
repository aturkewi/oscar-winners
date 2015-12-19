module Adapters
  class MovieClient

    include HTTParty

    attr_reader :connection

    def initialize
      @connection = self.class
    end

    def get_json
      results = connection.get('http://oscars.yipitdata.com/')
      json = RecursiveOpenStruct.new(results, :recurse_over_arrays => true)
    end

    def find_winner(films_array)
      films_array.find do |film|
        film.Winner
      end
    end

    def get_winners
      json = get_json
      json.results.collect do |films_array|
        find_winner(films_array.films)
      end
    end

  end
end
