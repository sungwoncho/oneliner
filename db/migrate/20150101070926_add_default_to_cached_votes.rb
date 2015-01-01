class AddDefaultToCachedVotes < ActiveRecord::Migration
  def up
    change_column :onelines, :cached_votes, :integer, default: 0
  end

  def down
    change_column :onelines, :cached_votes, :integer, default: nil
  end
end
