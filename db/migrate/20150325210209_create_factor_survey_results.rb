class CreateFactorSurveyResults < ActiveRecord::Migration
  def change
    create_table :factor_survey_results do |t|
      t.references :factor, index: true
      t.references :survey_result, index: true
      t.integer :score

      t.timestamps
    end
  end
end
