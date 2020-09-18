class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:edit, :update, :destroy]
  before_action :user_set, only: [:edit, :update, :destroy]
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_path
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報を変更しました'
      redirect_to edit_user_path
    else
      flash.now[:danger] = 'ユーザ情報の変更が失敗しました'
      render :edit
    end
  end

  def destroy
    @user.destroy
    flash[:success] = 'ユーザを削除しました'
    redirect_back(fallback_location: root_path)

  end
  
  private
  
  def user_set
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
end
