class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :permission
      t.string :phone
      t.references :company, index: true

      t.timestamps
    end
  end
end
