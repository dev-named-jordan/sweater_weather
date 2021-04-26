class SalaryService
      def self.conn
        Faraday.new(url: 'https://api.teleport.org')
      end

      def self.parse(response)
        JSON.parse(response.body, symbolize_names: true)
      end

      def self.get_location(location)
        response = conn.get("/api/cities/?search=#{location}") do |f|
          f.params['search'] = location
        end
        parse(response)
      end
    end
