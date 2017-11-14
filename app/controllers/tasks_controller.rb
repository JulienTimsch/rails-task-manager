class TasksController < ApplicationController
  # taskS if multiple tasks, no s if single task!!!!
  # ? do I need the before_action => no, like this it does the same, but less DRY

  # making my code DRY in: show, edit, update & destroy
  def set_task
    @task = Task.find(params[:id])
  end

  # security thing and to use params
  def task_params
    params.require(:task).permit(:name, :description, :done)
  end

  def index
    @tasks = Task.all
  end

  def show
    set_task
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task) #Yes works
  end

  def edit
    set_task
  end

  def update
    set_task
    @task.update(task_params)
    redirect_to task_path(@task) #check!!!
  end

  def destroy
    set_task
    @task.destroy
    redirect_to tasks_path #check!!!
  end
end
