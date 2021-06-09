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
    @user = User.find(params[:user_id])
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    redirect_to user_project_path(@project.user, @project)
  end

  def destroy
    @project = Project.find(params[:id])
    @user = @project.user
    @project.destroy
    redirect_to user_path(@user)
  end

  private

  def project_params
    params.require(:project).permit(:name, :category, :length, subcontractor_ids:[], client_attributes: [:name, :budget], subcontractors_attributes: [:name, :specialty],
    materials_attributes: [:name, :price, :quantity])
  end

end
