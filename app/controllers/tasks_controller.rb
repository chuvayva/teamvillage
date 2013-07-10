class TasksController < ApplicationController

  load_and_authorize_resource

  responders :flash
  respond_to :html, :json

  def index
    respond_with @project, @tasks
  end

  def show
    respond_with @task 
  end

  def new
    #TODO: add rescue
    @task.project = Project.find params[:project_id]
    # @task.project = Project.find_by_id params[:project_id]
    init_form_collections
  end

  def edit
    init_form_collections
  end

  def create
    init_form_collections unless @task.save
    respond_with @task.project, @task
    # respond_to do |format|
    #   if @task.save
    #     format.html do 

    #       if @task.project
    #         redirect_to @task.project, notice: 'Task was successfully created.' 
    #       else
    #         redirect_to @task, notice: 'Task was successfully created.' 
    #       end
    #     end

    #     format.json { render json: @task, status: :created, location: @task }
    #   else
    #     init_form_collections
    #     format.html { render action: "new" }
    #     format.json { render json: @task.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def update
    init_form_collections unless @task.update_attributes(params[:task])
    respond_with @task.project, @task
  end

  def destroy
    @task.destroy
    respond_with @task
  end

  def close
    @task.close
    init_form_collections unless @task.save
    respond_with @task
  end

  private

  def init_form_collections  
    @all_users = User.select 'id, name'
    @all_projects = Project.select 'id, name'
    @all_statuses = Hash[Task.get_status_values].values
    @all_statuses.delete :closed
  end
end
