require 'securerandom'

class Key < ActiveRecord::Base

  before_validation :create_key
  validates :key, uniqueness: true
  validates :key, presence: true

  def create_key
    unless self.key
      self.key = SecureRandom.hex
    end
  end
end
