class Technology < ActiveRecord::Base
  belongs_to :factor
  belongs_to :amt_type
end
