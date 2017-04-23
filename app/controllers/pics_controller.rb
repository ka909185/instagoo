class PicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pic, only: [:edit, :update, :destroy]
  def index
    @pics = Pic.all
  end

  def new
    if params[:back]
      @pic = Pic.new(pics_params)
    else
      @pic = Pic.new
    end
  end

  def confirm
    @pic = Pic.new(pics_params)
    render :new if @pic.invalid?
  end

  def create
    @pic = Pic.new(pics_params)
    @pic.user_id = current_user.id
    if @pic.save
      redirect_to pics_path, notice: "写真を投稿しました！"
      NoticeMailer.sendmail_pic(@pic).deliver
    else
      render 'new'
    end
  end

  def edit
    @pic = Pic.find(params[:id])
  end

  def update
    @pic = Pic.find(params[:id])
    if @pic.update(pics_params)
      redirect_to pics_path, notice: "写真を更新しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @pic = Pic.find(params[:id])
    @pic.destroy
    redirect_to pics_path, notice: "写真を削除しました！"
  end

  private
    def pics_params
      params.require(:pic).permit(:title, :content)
    end
    def set_pic
      @pic = Pic.find(params[:id])
    end
end
