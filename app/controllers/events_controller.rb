# frozen_string_literal: true
class EventsController < ApplicationController
  before_action :create_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show

  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
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

  def add_comments
    Event.find(params[:event_id]).comments.create("body"=>params[:body])
    redirect_to event_path(id:params[:event_id])
  end

  def enrollment
    @events = Event.all
    @enrollment = Enrollment.new(event_id: params[:event_id], user_id: params[:user_id])
    @enrollment.save
  end

  private

  def create_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :event_date, :user_id, :category_id)
  end

end
