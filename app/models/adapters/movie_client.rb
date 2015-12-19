module Adapters
  class MovieClient

    include HTTParty

    attr_reader :connection

    def initialize
      @connection = self.class
    end

    def get_json(url)
      results = connection.get(url)
      json = RecursiveOpenStruct.new(results, :recurse_over_arrays => true)
    end

    def find_winner(films_array)
      films_array.find do |film|
        film.Winner
      end
    end

    def get_winners
      json = get_json('http://oscars.yipitdata.com/')
      json.results.collect do |films_array|
        find_winner(films_array.films)
      end
    end

    def format_year(unformatted_year)
      date_string = unformatted_year.scan(/\(([^)]+)\)/).flatten.first
      date_string.strip.split("-").first
    end

    # NO BUDGET: 1929, 1937, 1944, 1949, 1952
    # 1981 uses £
    def format_budget(unformatted_budget)
      if unformatted_budget
        budget_in_words = unformatted_budget.gsub(/ *\[[^)]*\] */, "").
          gsub(/ *\([^)]*\) */, "").gsub("US","")
      else
        "NO BUDGET NO BUDGET NO BUDGET NO BUDGET NO BUDGET NO BUDGET "
      end
    end

    # need to get Year-Title-Budget
    def winner_data(winner)
      results=get_json(winner['Detail URL'])
      year = format_year(results[" Release dates "])
      title = results.Title
      budget = format_budget(results.Budget)

      puts "#{year} - #{title} - #{budget}"
    end

    def seed
      get_winners.each do |winner|
        winner_data(winner)
      end
    end

  end
end
