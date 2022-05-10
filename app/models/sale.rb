class Sale < ApplicationRecord
  belongs_to :customer
  store_accessor :data, :product_ids
end
