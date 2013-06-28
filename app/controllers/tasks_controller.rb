class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new
    @task.project = Project.find_by_id params[:project_id]
    init_form_collections
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
    authorize! :update, @task
    init_form_collections
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    
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
    @task = Task.find(params[:id])
    authorize! :update, @task

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
    @task = Task.find(params[:id])
    authorize! :destroy, @task

    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  def close
    @task = Task.find(params[:id])
    authorize! :close, @task

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
