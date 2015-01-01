class AddCachedVotesToOnelines < ActiveRecord::Migration
  def change
    add_column :onelines, :cached_votes, :integer
  end
end
