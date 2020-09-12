class TasksController < ApplicationController
  before_action :require_user_logged_in
  before_action :set_task, onky: [:edit, :update, :done, :wip]
  before_action :correct_user, only: [:destroy]
  
  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      flash[:success] = 'タスクを追加しました'
      redirect_to root_path
    else
      @tasks = current_user.tasks.order(id: :desc)
      flash.now[:danger] = 'タスクの追加に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
    @sub_task = @task.sub_tasks.build
  end

  def update
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
  
  #未達ボタン処理
  def done
    @task.update(done: "True")
    flash[:success] = '達成しました。おつかれさまです。'
    redirect_to root_path
  end
  
  #達成ボタン処理
  def wip
    @task.update(done: "False")
    flash[:secondary] = '状態を戻しました。'
    redirect_to root_path
  end

  private
  
  def set_task
    @task = Task.find(params[:id])
  end
  
  def task_params
    params.require(:task).permit(:content, :done)
  end
  
  def correct_user
    @task = current_user.tasks.find_by(id: params[:id])
    unless @task
      redirect_to root_url
    end
  end
end
