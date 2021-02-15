require_relative '../query_processor'

describe QueryProcessor do
  let(:csv_file_path) { 'ev_data.csv' }
  let(:vehicle_id) { 'cat-car' }
  let(:result) { QueryProcessor.run(query, csv_file_path, vehicle_id) }

  context 'query is valid' do
    let(:query) { 'average_daily_miles' }

    before { allow(Car).to receive(:send) }

    it 'should call Car.send with correct params' do
      result
      expect(Car).to have_received(:send).with(query, csv_file_path, vehicle_id)
    end
  end

  context 'query is invalid' do
    let(:query) { 'invalid_query' }

    it 'should raise' do
      expect { result }.to raise_error "Query invalid_query not valid."
    end
  end
end
