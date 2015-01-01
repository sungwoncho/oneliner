class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user
      t.references :oneline
      t.string :type, null: false

      t.timestamps
    end
  end
end