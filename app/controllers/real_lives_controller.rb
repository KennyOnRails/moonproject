class RealLivesController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @real_life = @project.real_lives.new()
  end
  def create
    @project = Project.find(params[:project_id])
    @real_life = @project.real_lives.new(real_life_params)
    if @real_life.save then
      redirect_to wizard_project_path(@project)
    else
      render :new
    end
  end
  def edit
    @project = Project.find(params[:project_id])
    @real_life = @project.real_lives.find(params[:id])
  end
  def update
    @project = Project.find(params[:project_id])
    @real_life = @project.real_lives.find(params[:id])
    if @real_life.update(real_life_params) then
      redirect_to wizard_project_path(@project)
    else
      render :edit
    end
  end
  def destroy
    @project = Project.find(params[:project_id])
    @real_life = @project.real_lives.find(params[:id])
    @real_life.destroy
    redirect_to wizard_project_path(@project)
  end
  private
  def real_life_params
    params.require(:real_life).permit(:schedule_type, :description, :notify_flag, :schedule_num)
  end
end
