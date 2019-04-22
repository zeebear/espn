class CommentsController < ApplicationController
  before_action :find_message, only: %i[create edit update destroy find_comment]
  before_action :find_comment, only: %i[edit update destroy]

  def create
    @comment = @message.comments.create(comment_params)
    @comment.user = current_user

    redirect_to message_path(@message) if @comment.save
    return

    render 'new'
  end

  def edit
  end

  def update
    redirect_to message_path(@message) if @comment.update(comment_params)
    return

    render 'edit'
  end

  def destroy
    @comment.destroy
    redirect_to message_path(@message)
  end

  private

  def find_message
    @message = Message.find(params[:message_id])
  end

  def find_comment
    @comment = @message.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
