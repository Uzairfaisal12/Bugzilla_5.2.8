# frozen_string_literal: true

class BuggsController < ApplicationController
  before_action :find_bugg, only: %i[show edit update destroy]

  def index
    @buggs = Bugg.all
  end

  def new
    @project = Project.find(params[:project_id])
    @bugg = @project.buggs.build

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @project = Project.find(params[:project_id])

    respond_to do |format|
      if @project.buggs.create(bugg_params)
        @buggs = Bugg.all

        format.html { redirect_to project_path(@project), notice: 'Bug was successfully created.' }
        format.json { render :show, status: :created, location: @bugg }
        format.js
      else
        f.html { render :new, status: :unprocessable_entity }
        f.json { render json: @bugg.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @project = Project.find(params[:project_id])
    @bugg = @project.buggs.find(params[:id])
  end

  def update
    @project = Project.find(params[:project_id])
    @bugg = @project.buggs.find(params[:id])

    respond_to do |f|
      if @bugg.update(bugg_params)
        f.html { redirect_to project_path(@project), notice: 'Bug was successfully updated.' }
        f.json { render :show, status: :ok, location: @bugg }
      else
        f.html { render :edit, status: :unprocessable_entity }
        f.json { render json: @bugg.errors, status: :unprocessable_entity }
      end
    end
  end

  def show; end

  def destroy
    @bugg.destroy
    redirect_to project_url
  end

  def start_working
    @project = Project.find(params[:project_id])
    @bugg = @project.buggs.find(params[:id])

    if @bugg.update(state: 'started')
      redirect_to project_path(@project), notice: 'Started Successfully'
    else
      redirect_to project_path(@project)
    end
  end

  def in_progress
    @project = Project.find(params[:project_id])
    @bugg = @project.buggs.find(params[:id])
    if @bugg.update(state: 'inprogress')
      redirect_to project_path(@project), notice: 'Started Successfully'
    else
      redirect_to project_path(@project)
    end
  end

  def completed
    @project = Project.find(params[:project_id])
    @bugg = @project.buggs.find(params[:id])
    if @bugg.update(state: 'completed')
      redirect_to project_path(@project), notice: 'Completed Successfully'
    else
      redirect_to project_path(@project)
    end
  end

  private

  def find_bugg
    @bugg = Bugg.find_by_id(params[:id])
  end

  def bugg_params
    params.require(:bugg).permit(:title, :image, :description, :startdate, :status, :state)
  end
end
