class ProjectsController < ApplicationController
  def index
    if params.has_key?("token-qry") then
      @project = Project.find_by_token(params["token-qry"])
      redirect_to wizard_project_path(@project)
    else
      @projects = Project.all
    end
  end
  def new
    @project = Project.new
  end
  def create
    @project = Project.new(project_params)
    if @project.save then
      redirect_to wizard_project_path(@project)
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
      ProjectMailer.notify_project(@project).deliver_now!
      redirect_to projects_path
    else
      redirect_to :wizard
    end
  end
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end
  private
  def project_params
    params.require(:project).permit(:target, :subtarget, :success_define, :possible,
                                    notify_attributes:[:email])
  end
end
