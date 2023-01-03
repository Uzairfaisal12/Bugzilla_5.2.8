class RemoveUsersFromProjects < ActiveRecord::Migration[5.2]
  def change
    # remove_reference :project_users, :user, foreign_key: true
    remove_foreign_key :project_users, :rouusers
  end
end
