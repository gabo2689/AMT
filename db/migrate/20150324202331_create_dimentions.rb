class CreateDimentions < ActiveRecord::Migration
  def change
    create_table :dimentions do |t|
      t.string :title
      t.integer :weight
      t.references :priority, index: true

      t.timestamps
    end
  end
end
