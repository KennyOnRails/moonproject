class ProgressesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @progress = @project.progresses.new
  end
  def create
    @project = Project.find(params[:project_id])
    @progress = @project.progresses.new(progress_params)
    if @progress.save then
      redirect_to wizard_project_path(@project)
    else
      render :new
    end
  end
  def edit
    @project = Project.find(params[:project_id])
    @progress = @project.progresses.find(params[:id])
  end
  def update
    @project = Project.find(params[:project_id])
    @progress = @project.progresses.find(params[:id])
    if @progress.update(progress_params) then
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    @project = Project.find(params[:project_id])
    @progress = @project.progresses.find(params[:id])
    @progress.destroy
    redirect_to wizard_project_path(@project)
  end
  def confirm
    @project = Project.find(params[:project_id])
    @progress = @project.progresses.find(params[:id])
    @progress.confirm!
    @project.add_confirm!
    redirect_to wizard_project_path(@project)
  end

  private
  def progress_params
    params.require(:progress).permit(:deadline, :description)
  end
end
