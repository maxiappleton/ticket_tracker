class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]

  def index
    @tickets = params[:project].present? ? Ticket.where(project_id: params[:project]) : Ticket.all
    @tickets = @tickets.where(status: params[:status]) if params[:status].present?
    @tickets = @tickets.joins(:tags).where("tags.id": params[:tag]) if params[:tag].present?
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
    params.require(:ticket).permit(:project_id, :name, :body, :status, :assignee_id, :tag_ids => [])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end