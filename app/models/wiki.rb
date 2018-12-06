class Wiki < ApplicationRecord
  belongs_to :user

  default_scope { order('created_at DESC') }

  scope :visible_to, -> (current_user) do
    return all if user.premium? || user.admin?
    where(private: [false])
  end

  validates :title, length: {minimum: 5}, presence: true
  validates :body, length: { minimum: 20}, presence: true
  validates :user, presence: true
end
