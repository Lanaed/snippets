class Question < ActiveRecord::Base

  has_many :answers, dependent: :destroy
  has_many :votes, as: :voteable

  validates :title, uniqueness: true
  validates :title, :body, presence: true
end
