class Item < ApplicationRecord

  has_many :cart_items, dependent: :destroy
  belongs_to :genre

  attachment :image

  validates :name, presence: true
  validates :image, presence: true
end
