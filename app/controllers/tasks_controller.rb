class TasksController < ApplicationController
  load_and_authorize_resource
  # GET /tasks
  # GET /tasks.json
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task.project = Project.find_by_id params[:project_id]
    init_form_collections
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    init_form_collections
  end

  # POST /tasks
  # POST /tasks.json
  def create
    respond_to do |format|
      if @task.save
        format.html do 

          if @task.project
            redirect_to @task.project, notice: 'Task was successfully created.' 
          else
            redirect_to @task, notice: 'Task was successfully created.' 
          end
        end

        format.json { render json: @task, status: :created, location: @task }
      else
        init_form_collections
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        init_form_collections
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def close
    @task.close
    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully closed.' }
        format.json { head :no_content }
      else
        init_form_collections
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def init_form_collections  
    @all_users = User.select 'id, name'
    @all_projects = Project.select 'id, name'
    @all_statuses = Hash[Task.get_status_values].values
    @all_statuses.delete :closed
  end
end
