class ShippingAddress < ApplicationRecord
  belongs_to :customer

  validates :postcode, presence: true
  validates :address, presence: true
  validates :name, presence: true

  def full_address
    self.postcode + self.address + self.name
  end
end
