class CreateTechnologies < ActiveRecord::Migration
  def change
    create_table :technologies do |t|
      t.text :title
      t.text :description
      t.text :benefits
      t.text :others
      t.text :summary
      t.integer :weight
      t.references :factor, index: true
      t.references :amt_type, index: true

      t.timestamps
    end
  end
end
