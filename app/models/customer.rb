class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true,
                             format: {
                               with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                               message: "を全角カタカナのみで入力して下さい"
                             }
  validates :first_name_kana, presence: true,
                               format: {
                               with: /\A[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+\z/,
                               message: "を全角カタカナのみで入力して下さい"
                             }
  validates :phone_number, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
  validates :postcode, presence: true
  validates :address, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items
  has_many :orders
  has_many :shipping_addresses

  def active_for_authentication?
    super && (self.is_quit == false)
  end

  def now_address
     self.postcode + self.address + self.last_name + self.first_name
  end


end
