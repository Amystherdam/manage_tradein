class Sale < ApplicationRecord
  belongs_to :customer
  has_one_attached :outgoing_invoice

  attr_accessor :quantiti
  store_accessor :data, :product

  before_save :prepare_attrs_sale_products, :clear_products_list

  def clear_products_list
    return if self.id.nil?

    Sale.find(self.id).product.clear
  end

  def prepare_attrs_sale_products
    return if /:id=>\d{1,}, :quantiti=>\d{1,}/.match(self.product.first)

    self.product.each_with_index do |product, i| 
      product.delete!("}]")
      product.concat(", :quantiti=>#{self.quantiti[i]}}]")
    end
  end
end
