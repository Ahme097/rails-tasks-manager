class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def edit
  end

  def show
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    # No need for app/views/tasks/update.html.erb
    redirect_to tasks_path
  end

  def new
    @task = Task.new # Needed to instantiate the form_with
  end

  def create
    task = Task.new(tasks_params)
    task.save
    # No need for app/views/restaurants/create.html.erb
    redirect_to tasks_path
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    # No need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path, status: :see_other
  end


  private

  def tasks_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
