class ProjectsController < ApplicationController

  load_and_authorize_resource

  responders :flash 
  respond_to :html, :json

  def index
    respond_with @projects
  end

  def show
    respond_with @project 
  end

  def new
    @project.owner = current_user

    @all_users = User.select 'id, name'
  end

  def edit
    @all_users = User.select 'id, name'
  end

  def create
    @project.save
    respond_with @project
  end

  def update
    @project.update_attributes(params[:project])
    respond_with @project
  end

  def destroy
    @project.destroy
    respond_with @project
  end
end
