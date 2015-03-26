class AmtType < ActiveRecord::Base
  validates_presence_of :title
  accepts_nested_attributes_for :technologies
end
