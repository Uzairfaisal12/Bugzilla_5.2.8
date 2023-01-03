# frozen_string_literal: true

class AddReferencesToBuggs < ActiveRecord::Migration[5.2]
  def change
    add_reference :buggs, :project, foreign_key: true
  end
end
