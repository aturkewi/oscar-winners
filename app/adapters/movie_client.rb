module Adapters
  class MovieClient
    include HTTParty

    attr_reader :connection

    def initialize
      @connection = self.class
    end

    def query(end_path)
      results = connection.get("http://data.cityofnewyork.us" + end_path)
    end

    def get_json
      connection.get('http://oscars.yipitdata.com/')
    end


    # def connection
    #   @connection = Adapters::SODAConnection.new
    # end

    # def get_json_data
    #   hospital_array = connection.query("/resource/f7b6-v6v3.json")
    #   hospital_array.each do |hospital_data|
    #     borough_num=BOROUGH_HASH[hospital_data['borough'].downcase]
    #     Hospital.create(name:hospital_data['facility_name'], hospital_type:hospital_data['facility_type'], borough_id:borough_num)
    #   end
    # end

  end
end
