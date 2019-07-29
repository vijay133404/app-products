class Product < ApplicationRecord
	has_many :product_suppliers, :dependent => :destroy
	has_many :suppliers, :through => :product_suppliers
	#accepts_nested_attributes_for :product_id ,:product_title,:supplier_id,:supplier_name,:price,:is_active,:category


	def self.import(file)
		spreadsheet = Roo::Spreadsheet.open(file.path)
		header = spreadsheet.row(1)
		(2..spreadsheet.last_row).each do |i|
			row = Hash[[header, spreadsheet.row(i)].transpose]
			product = find_by_id(row["product_id"].to_i) || new
			product.id = row["product_id"].to_i
			product.product_title = row["product_title"]
			product.category = row["category"]
			product.price = row["price"].to_f
			product.is_active = row["is_active"]
			product.save!
			supplier = Supplier.find_by_id(row["supplier_id"].to_i) ||  Supplier.new
			supplier.id = row["supplier_id"].to_i
			supplier.supplier_name = row["supplier_name"]
			supplier.save!
			ProductSupplier.create(product_id: product.id ,supplier_id: supplier.id)
		end
	end

	def self.open_spreadsheet(file)
		case File.extname(file.original_filename)
		when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
		when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
		when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
		else raise "Unknown file type: #{file.original_filename}"
		end
	end

	def default_image
		if self.image.present?
			self.image.url
		else
			"http://placehold.it/120x120&text=image1"
		end
	end
end
