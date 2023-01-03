# frozen_string_literal: true

class UpdateProjectUserTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :project_users, :project_developers
  end
end
