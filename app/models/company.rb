class Company < ActiveRecord::Base
  validates_presence_of :name , :city
end