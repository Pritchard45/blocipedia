class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  default_scope { order('created_at DESC') }

  scope :visible_to, -> (current_user) do
    return all if user.premium? || user.admin?
    where(private: [false, nill])
  end

  validates :title, length: {minimum: 1}, presence: true
  validates :body, length: { minimum: 5}, presence: true


  # validates :user, presence: true
  def collaborators
    Collaborator.where(wiki_id: id)
  end

end
