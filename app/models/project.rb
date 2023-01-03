# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :buggs, dependent: :destroy
  has_many :project_users
  has_many :users, through: :project_users, dependent: :destroy

  validates :title, :description, presence: true, length: { minimum: 10 }
end
