class Priority < ActiveRecord::Base
  has_many :dimentions
  validates_presence_of :title, :weight
  validates_numericality_of :weight, greater_than_or_equal_to: 0, less_than_or_equal_to: 100

end
