# frozen_string_literal: true

class CreateQaProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :qa_projects do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
