# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :email, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: { manager: 0, developer: 1, qa: 2 }

  has_many :project_users, dependent: :destroy
  has_many :projects, through: :project_users
end
