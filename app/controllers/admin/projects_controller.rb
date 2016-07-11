class Admin::ProjectsController < ApplicationController
  layout "admin"
  def index
    @projects = Project.where(project_state: "new")
  end
  def destroy
    @project = Project.find(params[:id])
    @project.delete_project!
    respond_to do |format|
      format.html { redirect_to admin_projects_path }
      format.json { head :no_content }
      format.js   { render :layout => false}
    end
  end
end
