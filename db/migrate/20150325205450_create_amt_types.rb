class CreateAmtTypes < ActiveRecord::Migration
  def change
    create_table :amt_types do |t|
      t.string :title

      t.timestamps
    end
  end
end
