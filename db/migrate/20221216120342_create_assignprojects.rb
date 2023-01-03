# frozen_string_literal: true

class CreateAssignprojects < ActiveRecord::Migration[5.2]
  def change
    create_table :assignprojects do |t|
      t.references :project, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
