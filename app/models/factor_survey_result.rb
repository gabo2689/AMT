class FactorSurveyResult < ActiveRecord::Base
  belongs_to :factor
  belongs_to :survey_result
end
