class CommentsController < ApplicationController
  before_action :find_message, only: %i[create]
  before_action :find_comment

  def new

  end

  def create
    @comment = @message.comments.create(comment_params)
    @comment.user = current_user

    redirect_to message_path if @comment.save
    return

    render 'new'
  end

  private

  def find_message
    @message = Message.find(params[:message_id])
  end

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
