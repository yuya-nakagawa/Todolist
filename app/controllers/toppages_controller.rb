class ToppagesController < ApplicationController
  def index
    if logged_in?
      @task = current_user.tasks.build
      # 検索拡張機能として.search(params[:search])を追加 
      @tasks = current_user.tasks.search(params[:search]).order(id: :desc)
    end
  end
end