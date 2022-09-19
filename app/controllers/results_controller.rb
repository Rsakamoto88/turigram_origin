class ResultsController < ApplicationController
  #　↓ログインしていないユーザーのアクセス制限
  before_action :authenticate_user!, except: [:index]
  def index
    @results = Result.all
  end

  def show
    @result = Result.find(params[:id])
  end

  def new
    @result = Result.new
  end
  
  def create 
    @result = Result.new(result_params)
    # ↓投稿するのはログインしている人と指定する
    @result.user_id = current_user.id
    # if文でバリデーションに引っかかってしまったら
    if @result.save 
    redirect_to result_path(@result), notice:'投稿に成功しました。' 
    else
      # renderはアクションを返さずにviewsのnew.htmlを返す
      render :new 
    end
  end

  def edit
    @result = Result.find(params[:id])
    if @result.user != current_user
        redirect_to results_path, alert: "不正なアクセスです。"
    end
  end
  
  def update
    @result = Result.find(params[:id])
    if @result.update(result_params)
      redirect_to result_path(@result), notice:'更新に成功しました。'
    else
      render :edit
    end
  end
  
  def destroy
    result = Result.find(params[:id])
    result.destroy
    redirect_to result_path 
  end
  # タイトル、内容、画像を編集を許可する
  private
  def result_params
    params.require(:result).permit(:title, :body, :image)
  end
end