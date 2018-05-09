class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]

  def index
    if params[:tag].present?
      @tickets = Tag.find(params[:tag]).tickets
    else
      @tickets = Ticket.all
    end
  end

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.creator = current_user

    if @ticket.save
      flash[:notice] = "Your ticket has been created!"
      redirect_to tickets_path
    else
      flash[:alert] = "Could not create ticket"
      render :new
    end
  end
  
  def edit
  end

  def update
    if @ticket.update(ticket_params)
      flash[:notice] = "Your ticket has been updated!"
      redirect_to ticket_path(@ticket)
    else
      flash[:alert] = "Could not update ticket"
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def ticket_params
    params.require(:ticket).permit(:project_id, :name, :body, :status, :tag_ids => [])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end