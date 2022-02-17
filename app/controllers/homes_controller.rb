class HomesController < ApplicationController
  def index
    @events = Event.all.order("event_date asc")
    if params[:search]
      @events = Event.where("category_id=?",(Category.where("category_name=?",params[:search]).pluck(:id)))
    else
      @events = Event.all.order("event_date asc")
    end
  end
end
