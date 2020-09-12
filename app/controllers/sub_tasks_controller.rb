class SubTasksController < ApplicationController
  before_action :require_user_logged_in

  def create
    @task = Task.find_by(id: params[:id])

    @sub_task = @task.sub_tasks.build(sub_task_params)
    if @sub_task.save
      flash[:success] = 'サブタスクを追加しました'
      redirect_to root_path
    else
      flash.now[:danger] = 'サブタスクの追加に失敗しました。'
      render 'tasks/edit'
    end
  end

  def destroy
    @task = Task.find_by(id: params[:id])

    @sub_task = @task.sub_tasks
    @sub_task.destroy
    flash[:success] = 'サブタスクを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def sub_task_params
    params.require(:sub_task).permit(:content, :done)
  end
  
end
