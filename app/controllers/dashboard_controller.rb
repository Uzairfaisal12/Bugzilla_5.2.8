# frozen_string_literal: true

class DashboardController < ApplicationController
  def home
    @projects = if current_user.developer?
                  current_user.projects
                else
                  Project.all
                end
  end
end
