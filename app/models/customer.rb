class Customer < ApplicationRecord
  has_many :sales
  has_one_attached :avatar
end
