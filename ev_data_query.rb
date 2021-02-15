require './query_processor'

csv_file_path = ARGV[0]
query = ARGV[1]
param = ARGV[2]

QueryProcessor.run(query, csv_file_path, param)
