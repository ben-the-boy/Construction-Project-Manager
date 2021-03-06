class ProjectsController < ApplicationController
  before_action :require_login
  before_action :user_match
  skip_before_action :user_match, only: [:destroy, :update]

  def index
  end

  def new
    @user = User.find(params[:user_id])
    @project = @user.projects.new
  end

  def create
    @user = User.find(params[:user_id])
    @project = @user.projects.build(project_params)
    if @project.save
      redirect_to user_project_path(@user, @project)
    else
      render :new
    end
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
    if @project.update(project_params)
      redirect_to user_project_path(@project.user, @project)
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @user = @project.user
    @project.destroy
    redirect_to user_path(@user)
  end

  def longest_project
    if !current_user.projects.empty?
      @project = current_user.projects.longest_project.first
      render :show
    else
      redirect_to current_user
    end
  end

  private

  def project_params
    params.require(:project).permit(:name, :category, :length, subcontractor_ids:[], client_attributes: [:name, :email], subcontractors_attributes: [:name, :specialty],
    materials_attributes: [:name, :price, :quantity])
  end

end
