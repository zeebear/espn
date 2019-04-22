class MessagesController < ApplicationController
  before_action :find_message, only: %i[show edit update destroy]

  def index
    @messages = Message.all.order("created_at DESC")
  end

  def show
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)

    redirect_to root_path if @message.save
    return

    render 'new'
  end

  def edit
  end

  def update
    redirect_to message_path if @message.update(message_params)
    return

    render 'edit'
  end

  def destroy
    @message.destroy
    redirect_to root_path
  end

  private

  def find_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:title, :description)
  end
end
