class User < ActiveRecord::Base

  # has_and_belongs_to_many :skills
  has_many :skill_users
  has_many :skills, :through => :skill_users

  def proficiency_for(skill_object)
     return SkillUser.where(user_id: self.id, skill_id: skill_object.id).first.proficiency
  end

  def set_proficiency_for(skill_object, level)
    SkillUser.where(user_id: self.id, skill_id: skill_object.id).first.update(proficiency: level)
  end

end