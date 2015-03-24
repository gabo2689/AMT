class Dimention < ActiveRecord::Base
  belongs_to :priority

  validates_presence_of :title, :weight
  validates_numericality_of :weight, greater_than_or_equal_to: 0

end
