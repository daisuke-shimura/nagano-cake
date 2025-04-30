class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting_payment: 0, confirm_payment: 1, making: 2, preparing_ship: 3, shipped: 4}
  belongs_to :customer
  has_many :order_details

  def tax_total_cost
    (total_cost * 1.1).to_i
  end
end
