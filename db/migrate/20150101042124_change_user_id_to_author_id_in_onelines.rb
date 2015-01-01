class ChangeUserIdToAuthorIdInOnelines < ActiveRecord::Migration
  def change
    rename_column :onelines, :user_id, :author_id
  end
end
