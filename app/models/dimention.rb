class Dimention < ActiveRecord::Base
  belongs_to :priority
  has_many :factors
  validates_presence_of :title, :weight
  validates_numericality_of :weight, greater_than_or_equal_to: 0

  accepts_nested_attributes_for :factors

  def getId
    self.id
  end
end
