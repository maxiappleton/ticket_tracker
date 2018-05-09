class CommentsController < ApplicationController
  before_action :set_ticket
  before_action :set_comment, except: [:create]
  before_action :require_user
  
  def create
    @comment = Comment.new(comment_params)
    @comment.creator = current_user
    @comment.ticket = @ticket

    if @comment.save
      if params[:ticket_status].present?
        @ticket.update_attribute(:status, params[:ticket_status]);
      end
      flash[:notice] = 'Comment successfully added!'
      redirect_to ticket_path(@ticket)
    else
      flash[:alert] = 'Comment could not be saved'
      render :edit
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      if params[:ticket_status].present?
        @ticket.update_attribute(:status, params[:ticket_status]);
      end
      flash[:notice] = 'Comment successfully updated!'
      redirect_to ticket_path(@ticket)
    else
      flash[:alert] = 'Comment could not be updated'
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to ticket_path(@ticket)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end