# frozen_string_literal: true

class DropQaProjects < ActiveRecord::Migration[5.2]
  def change
    drop_table :qa_projects
  end
end
