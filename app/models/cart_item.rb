class CartItem < ApplicationRecord
  belongs_to :customer

  validates :item_id, uniqueness: true
end
