# frozen_string_literal: true

class RemoveStatusFromBuggs < ActiveRecord::Migration[5.2]
  def change
    remove_column :buggs, :status, :string
  end
end
