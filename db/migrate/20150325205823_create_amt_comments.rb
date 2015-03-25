class CreateAmtComments < ActiveRecord::Migration
  def change
    create_table :amt_comments do |t|
      t.text :comment
      t.references :technology, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
