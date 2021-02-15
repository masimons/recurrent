require './car.rb'

module QueryProcessor
	def self.valid?(query)
		['average_daily_miles', 'charged_above'].include?(query)
	end

	def self.run(query, csv_file_path, param)
		if valid?(query)
			Car.send(query, csv_file_path, param)
		else
			raise StandardError, "Query #{query} not valid."
		end
	end
end
