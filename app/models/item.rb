class Item < ApplicationRecord

  validates :image, presence: {message: 'を選択してください'}
  validates :name, presence: true
  validates :description, presence: true

  belongs_to :genre

  validates :price, presence: true
  validates :is_sale, inclusion: {in: [true, false]}

  has_many :cart_items, dependent: :destroy

  attachment :image

end
