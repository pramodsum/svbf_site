class HomeController < ApplicationController
  def index
    @date = params[:date] ? Date.parse(params[:date]) : Date.today
    @events_by_date = Event.group(@date.wday)
  end
end
