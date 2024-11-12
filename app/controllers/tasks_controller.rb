class TasksController < ApplicationController
  before_action :find_task, only: [:edit, :update, :show, :destroy]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit; end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  def update
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def show
    @task.save
  end

  private

  def find_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
