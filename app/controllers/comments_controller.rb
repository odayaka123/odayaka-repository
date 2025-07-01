class CommentsController < ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :require_login
  before_action :correct_user, only: [:edit, :update, :destroy]

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to @post, notice: "コメントを投稿しました"
    else
      redirect_to @post, alert: "コメントの投稿に失敗しました"
    end
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @post, notice: "コメントを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @post, notice: "コメントを削除しました"
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = @post.comments.find(params[:id])
  end

  def correct_user
    redirect_to @post, alert: "権限がありません" unless @comment.user == current_user
  end
end
