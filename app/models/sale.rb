class Sale < ApplicationRecord
  belongs_to :customer
  has_one_attached :outgoing_invoice

  store_accessor :data, :product_ids
end
