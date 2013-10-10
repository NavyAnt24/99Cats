class Cat < ActiveRecord::Base
  attr_accessible :age, :birth_day, :color, :name, :sex
  validates :age, :birth_day, :color, :name, :sex, :presence => true

  validates :age, numericality: true
  validates :color, inclusion: { in: %w{brown black white},
            message: "%{value} is not a valid color"}
  validates :sex, inclusion: { in: %w{M F},
             message: "%{value} is not a valid sex"}

end