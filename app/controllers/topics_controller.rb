class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only: [:show, :edit, :update, :destroy]

  def index
    @topics = Topic.all
  end

  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
  end


  def new
    @topic = Topic.new
    if params[:back]
      @topic = Topic.new(topics_params)
    else
      @topic = Topic.new
    end
  end


  def edit
    @topic = Topic.find(params[:id])
  end


  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
      if @topic.save
        redirect_to topics_path, notice: 'Topicを作成しました'
        #deliverメソッドでNoticeMailerのsendmail_topicメソッドを呼び出す。
        NoticeMailer.sendmail_topic(@topic).deliver
      else
        render :new
      end
  end


  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topics_params)
      redirect_to topics_path, notice: "Topicを更新しました！"
    else
      render 'edit'
    end
  end


  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to topics_path,notice: "Topicを削除しました！"
  end

  private
    def topics_params
      params.require(:topic).permit(:title, :content)
    end

    def set_topic
      @topic = Topic.find(params[:id])
    end
end
