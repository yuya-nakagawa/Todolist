class SubTasksController < ApplicationController
  before_action :require_user_logged_in

  def create
    @task = Task.find(params[:id])
    @sub_task = @task.sub_tasks.build(sub_task_params)

    if @sub_task.save
      flash[:success] = 'サブタスクを追加しました'
      redirect_back(fallback_location: root_path)
    else
      flash.now[:danger] = 'サブタスクの追加に失敗しました。'
      render 'tasks/edit'
    end
  end

  def destroy
    @sub_task = SubTask.find(params[:id])
    
    @sub_task.destroy
    flash[:success] = 'サブタスクを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
    #未達ボタン処理
  def done
    @sub_task = SubTask.find(params[:id])

    @sub_task.update(done: "True")
    flash[:success] = '達成しました。おつかれさまです。'
    redirect_to root_path
  end
  
  #達成ボタン処理
  def wip
    @sub_task = SubTask.find(params[:id])

    @sub_task.update(done: "False")
    flash[:secondary] = '状態を戻しました。'
    redirect_to root_path
  end
  
  private
  
  def sub_task_params
    params.require(:sub_task).permit(:content, :done)
  end
  
end
