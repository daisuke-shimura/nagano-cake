class Item < ApplicationRecord
  has_many :cart_items
  has_many :order_details
  belongs_to :genre

  has_one_attached :image

  #def item_image_method(item)
  def get_item_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path), filename: 'no_image.jpeg')
    end
    image
  end

  def tax_price
    (price * 1.1).to_i
  end


  #検索用
  def self.ransackable_attributes(auth_object = nil)
    ["name"]
  end
  
end
