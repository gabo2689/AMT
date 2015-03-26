class Technology < ActiveRecord::Base
  validates_presence_of :title ,:weight, :description, :benefits
  validates :summary, length: { maximum: 140 }

  belongs_to :factor
  belongs_to :amt_type
end
