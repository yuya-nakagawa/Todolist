class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'タスクを追加しました'
      redirect_to root_path
    else
      @task = current_user.tasks.order(id: :desc)
      flash.now[:danger] = 'タスクの追加に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'タスク名を変更しました'
      redirect_to edit_task_path
    else
      flash.now[:danger] = 'タスク名の変更が失敗しました'
      render :edit
    end
  end

  def destroy
    @task.destroy
    flash[:success] = 'タスクを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def task_params
    params.require(:task).permit(:content)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
