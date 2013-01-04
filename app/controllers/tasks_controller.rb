class TasksController < ApplicationController
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all

		@incomplete_tasks = Task.where(complete: false) ## Added from ryan bates checklist
    @complete_tasks = Task.where(complete: true) ## Added from ryan bates checklist


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
      format.html { redirect_to tasks_url }
      format.js
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @task = Task.new

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.create!(params[:task]) ## New to create! follow ryan bates code

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
		@task.update_attributes!(params[:task]) ## Added from ryan bates checklist

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.js
    end
  end
end
