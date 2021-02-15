require 'csv'
require 'time'

module Car
	def self.average_daily_miles(csv_file_path, vehicle_id)
		csv = CSV.open(csv_file_path, headers: true)
		filtered = csv.filter { |row| row['vehicle_id'] == vehicle_id }
		miles = filtered.map { |vehicle| vehicle['odometer'].to_i }
		total_miles = miles.max - miles.min
		times = filtered.map { |vehicle| Time.parse(vehicle['created_at']) }
		range_in_days = (times.max - times.min)/86400.0

		pp (total_miles/range_in_days).truncate(2)
	end

	def self.charged_above(csv_file_path, percentage)
		data = CSV.open(csv_file_path, headers: true).to_a
		all_cars = data.map { |row| row['vehicle_id'] }.uniq
		filtered = data.filter { |row| row['charge_reading'].to_f <= percentage.to_f }

		pp (all_cars - filtered.map { |car| car['vehicle_id'] }.uniq).count
	end
end
