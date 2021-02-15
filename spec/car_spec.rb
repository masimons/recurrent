require_relative '../car'

describe Car do
	context '.average_daily_miles' do
		let(:csv_file_path) { 'ev_data.csv' }
		let(:vehicle_id) { 'cat-car' }
		let(:result) { Car.average_daily_miles(csv_file_path, vehicle_id) }

		it 'should return correct miles' do
			expect(result).to eq 10.32
		end
	end

	context '.charged_above' do
		let(:csv_file_path) { 'ev_data.csv' }
		let(:percentage) { '0.33' }
		let(:result) { Car.charged_above(csv_file_path, percentage) }

		it 'should return correct number of cars' do
			expect(result).to eq 2
		end
	end
end
