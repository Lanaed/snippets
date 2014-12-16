class Gadget < ActiveRecord::Base
  validates :body, :presence => true
  validates :name, :uniqueness => true
end