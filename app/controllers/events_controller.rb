# frozen_string_literal: true
class EventsController < ApplicationController
  before_action :create_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    # @event = Event.find(session[:user_id])

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    # @event = current_user.event.create(event_params)
    if @event.save
      flash[:notice] = "Event Suceesfully created"
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @event.update(event_params)
      flash[:notice] = "Event Successfully edited"
      redirect_to events_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  def profile
    @events = Event.all
  end

  private

  def create_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :event_date)
  end
end
