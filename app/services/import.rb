# require csv
class Import
	def self.bulk_import_csv(model_name, csv_data)
		csv_file = csv_data.read
		CSV.parse(csv_file, :headers => true, header_converters: :symbol) do |row|
         hash = row.to_hash
         @hash = hash
         res = model_name.new(@hash)
         res.save
		end
	end
end