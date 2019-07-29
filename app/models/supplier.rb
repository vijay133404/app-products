class Supplier < ApplicationRecord
	has_many :product_suppliers, :dependent => :destroy
	has_many :products, :through => :product_suppliers

	def active_product
		 self.products.where(is_active: true)
	end

	def total_product
		p_total_count = self.products.map(&:is_active)
	end
end
