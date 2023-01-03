# frozen_string_literal: true

class CreateBuggs < ActiveRecord::Migration[5.2]
  def change
    create_table :buggs do |t|
      t.string :title
      t.string :description
      t.datetime :startdate
      t.integer :status

      t.timestamps
    end
  end
end
