# frozen_string_literal: true

class RemameTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :assignprojects, :project_users
  end
end
