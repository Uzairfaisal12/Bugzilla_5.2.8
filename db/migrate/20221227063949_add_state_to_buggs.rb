# frozen_string_literal: true

class AddStateToBuggs < ActiveRecord::Migration[5.2]
  def change
    add_column :buggs, :state, :string, null: false, default: 'new created'
  end
end
