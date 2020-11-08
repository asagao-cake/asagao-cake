class Item < ApplicationRecord

  validates :image, presence: {message: 'を選択してください'}
  validates :name, presence: true
  validates :description, presence: true
  validates :genre, presence: true
  validates :price, presence: true
  validates :is_sale, presence: true

  has_many :cart_items, dependent: :destroy
  belongs_to :genre

  attachment :image

end
