class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end
  def new
    @project = Project.new
  end
  def create
    @project = Project.new(project_params)
    if @project.save then
      redirect_to project_path(@project)
    else
      render :new
    end
  end
  def show
    @project = Project.find(params[:id])
    @real_lives = @project.real_lives.all
    @progresses = @project.progresses
    @editable = false
  end
  def wizard
    @project = Project.find(params[:id])
    @project.build_notify if @project.notify.nil?
    @real_lives = @project.real_lives.all
    @progresses = @project.progresses
    @editable = true
  end
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params) then
      redirect_to projects_path
    else
      redirect_to :wizard
    end
  end
  private
  def project_params
    params.require(:project).permit(:target, :subtarget, :success_define, :possible,
                                    notify_attributes:[:email])
  end
end
