require_relative '../car'

describe Car do
	context '.average_daily_miles' do
		let(:csv_file_path) { 'ev_data.csv' }
		let(:vehicle_id) { 'cat-car' }
		let(:result) { Car.average_daily_miles(csv_file_path, vehicle_id) }

		context 'vehicle_id is cat-car' do
			let(:vehicle_id) { 'cat-car' }

			it 'should return correct miles' do
				expect(result).to eq 10.32
			end
		end

		context 'vehicle_id is electric-suv' do
			let(:vehicle_id) { 'electric-suv' }

			it 'should return correct miles' do
				# 99/6.847974537037037 = 14.45
				expect(result).to eq 14.45
			end
		end
	end

	context '.charged_above' do
		let(:csv_file_path) { 'ev_data.csv' }
		let(:result) { Car.charged_above(csv_file_path, percentage) }

		context 'percentage is 33%' do
			let(:percentage) { '0.33' }

			it 'should return correct number of cars' do
				expect(result).to eq 2
			end
		end

		context 'percentage is 20%' do
			let(:percentage) { '0.2' }
			
			it 'should return correct number of cars' do
				# clown, hamster, electric
				expect(result).to eq 3
			end
		end
	end
end
