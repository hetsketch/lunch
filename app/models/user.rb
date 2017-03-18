class User < ApplicationRecord
  before_create :set_admin
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, :email, presence: true
  validates :name, length: {in: 3..20}

  private
  def set_admin
    # set to admin field true if users table is empty
    self.admin = User.count == 0
  end

  has_many :orders
end
