class ProjectsController < ApplicationController

  def index
  end

  def new
    @user = User.find(params[:user_id])
    @project = @user.projects.new
  end

  def create
    @user = User.find(params[:user_id])
    project = @user.projects.create(project_params)
    redirect_to @user
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def project_params
    params.require(:project).permit(:name, :category, :length, :subcontractor_id)
  end

end
