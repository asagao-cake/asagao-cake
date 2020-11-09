class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  validates :item_count, presence: true, numericality: { only_integer: true, greater_than: 0}

end
