# frozen_string_literal: true

class ProjectsController < ApplicationController
  before_action :find_project, only: %i[show edit update destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to root_path, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to root_path, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def show
    @project = Project.find(params[:id])
  end

  def destroy
    @project.destroy
    redirect_to root_path
  end

  private

  def find_project
    @project = Project.find_by_id(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, user_ids:[])
  end
end
