class Article < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :body, :title, presence: true
end
