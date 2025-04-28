class Address < ApplicationRecord
  belongs_to :customer

  def address_label_method
    "〒#{post_number} #{address} #{name}"
  end
end
