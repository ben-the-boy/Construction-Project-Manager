class ProjectsController < ApplicationController

  def index
  end

  def new
    @user = User.find(params[:user_id])
    @project = @user.projects.new
  end

  def create
    @user = User.find(params[:user_id])
    @user.projects.create(project_params)
    redirect_to @user
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:name, :category, :length, subcontractor_ids:[], client_attributes: [:name, :budget], subcontractors_attributes: [:name, :specialty])
  end

end
