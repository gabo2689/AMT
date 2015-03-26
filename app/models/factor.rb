class Factor < ActiveRecord::Base
  belongs_to :dimention
  has_many :technologies



  accepts_nested_attributes_for :technologies

end
