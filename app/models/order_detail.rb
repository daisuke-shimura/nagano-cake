class OrderDetail < ApplicationRecord
  enum making_status: { not_making: 0, waiting_making: 1, making: 2, making_complete: 3}
  belongs_to :item
  belongs_to :order
end
