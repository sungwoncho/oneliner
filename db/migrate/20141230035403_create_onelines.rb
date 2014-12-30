class CreateOnelines < ActiveRecord::Migration
  def change
    create_table :onelines do |t|
      t.string :subject
      t.string :definition
      t.references :user

      t.timestamps
    end
  end
end
