class AddUserIdToProjectUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :project_users, :user, foreign_key: true
  end
end
