class Skill < ActiveRecord::Base

  # has_and_belongs_to_many :users
  has_many :skill_users
  has_many :users, :through => :skill_users

  validates :name, { :uniqueness => true }


  def user_with_proficiency(level)
    return User.find(SkillUser.where(proficiency: level, skill_id: self.id).first.user_id)
  end

end