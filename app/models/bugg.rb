# frozen_string_literal: true

class Bugg < ApplicationRecord
  validates :state, presence: true

  has_one_attached :image

  belongs_to :project
end
