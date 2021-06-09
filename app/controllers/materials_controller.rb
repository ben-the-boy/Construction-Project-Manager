class MaterialsController < ApplicationController

  def new
  end

  def create
  end

  def destroy
    @material = Material.find(params[:id]).destroy
    @project = @material.project
    @user = @project.user
    redirect_to edit_user_project_path(@user, @project)
  end

end
