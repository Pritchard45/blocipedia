class User < ApplicationRecord
  has_many :wikis, dependent: :destroy
  has_many :collaborators
  has_many :wikis, through: :collaborators


  before_save { self.role ||= :standard }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable





  enum role: [:standard, :premium, :admin]

  def collaborators
    Collaborator.where(user_id: id)
  end

  def wikis
    collaborators.wikis
  end
end
