class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_one :wishlist
  has_many :wishlistitems, through: :wishlist

  after_create :create_wishlist

  def create_wishlist
    Wishlist.create(user_id: self.id)
  end
end
