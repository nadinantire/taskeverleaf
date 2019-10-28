class TasksController < ApplicationController
  # before_action :authenticate_usr!
  # before_action :logged_in
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    if  params[:sort_expired]
      @tasks = Task.order('end_date DESC').page(params[:page])
    elsif params[:sort_priority] 
      @tasks = Task.order('priority DESC').page(params[:page])
    elsif params[:terms]
      @tasks = Task.where('content like ? or status like ?', "%#{params[:terms]}%", "%#{params[:terms]}%").order('id ASC').page(params[:page])
    else
      @tasks = Task.order('created_at DESC').page(params[:page])
    end
  end

  def search
    @task=task.search([:search])
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.create(task_params)

    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :content, :status, :priority, :usr_id, :terms, :start_date, :end_date)
    end
end
