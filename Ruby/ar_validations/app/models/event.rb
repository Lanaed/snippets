class Event < ActiveRecord::Base

  validates :organizer_name, presence: true
  validates :organizer_email, presence: true
  validates :title, presence: true
  validates :date, presence: true

  validates :title, uniqueness: true
  validate :in_past_check

  validates_format_of :organizer_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

  def in_past_check
    if date
      if date < Date.today
        errors.add(:date, "The event date cant be in the past!")
      end
    end
  end

end
