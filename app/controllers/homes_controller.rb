class HomesController < ApplicationController
  def index
    @events = Event.all.order("event_date asc")
  end
end
