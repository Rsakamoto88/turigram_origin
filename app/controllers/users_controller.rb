class UsersController < ApplicationController
  # ユーザーの一覧を表示
  def index
    @users = User.all
  end

  def show
  end

  def edit
  end
end
