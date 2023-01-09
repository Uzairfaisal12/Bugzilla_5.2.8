# frozen_string_literal: true

class RemoveUsersFromProjectusers < ActiveRecord::Migration[5.2]
  def change
    # remove_reference :projects, :user, foreign_key: true
    remove_foreign_key :projects, :users
  end
end
