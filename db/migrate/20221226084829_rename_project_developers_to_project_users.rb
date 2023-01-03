# frozen_string_literal: true

class RenameProjectDevelopersToProjectUsers < ActiveRecord::Migration[5.2]
  def change
    rename_table :project_developers, :project_users
  end
end
