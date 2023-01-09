# frozen_string_literal: true

class RemoveUsersFromProjectUsers < ActiveRecord::Migration[5.2]
  def change
    remove_reference :project_users, :user, index: true, foreign_key: true
  end
end
