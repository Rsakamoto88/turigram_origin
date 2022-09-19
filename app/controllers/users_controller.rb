class UsersController < ApplicationController
  #　↓ログインしていないユーザーのアクセス制限
  before_action :authenticate_user!, except: [:index]
  # ↓ユーザーの一覧を表示
  def index
    @users = User.all
  end
# 1人のUser情報→@user変数へ。controllerのactionで変数定義してviewに渡す
# params[:id]はuserに続くdb登録番号
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
        redirect_to users_path, alert: "不正なアクセスです。"
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # 更新→ユーザーの詳細画面に戻る
      redirect_to user_path(@user), notice:'更新に成功しました。'
    else
      # ログインユーザー以外が編集したら更新せずに編集画面へ
      render :edit
    end  
  end
  
  # usersコントローラー内でのみ使用可。セキュリティ強化
  private
  def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
  end

end
