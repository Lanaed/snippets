class Article < ActiveRecord::Base
  belongs_to :category

  def get_secret_key
    self.key = self.id.to_s + (0...5).map { (65 + rand(26)).chr }.join
    self.save
  end

end
