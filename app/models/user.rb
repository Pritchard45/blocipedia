class User < ApplicationRecord
  has_many :wikis, dependent: :destroy

  before_save { self.role ||= :standard }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable





  enum role: [:standard, :premium, :admin]
end
