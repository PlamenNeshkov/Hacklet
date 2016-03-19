class HomeController < ApplicationController
  def index
    @event = Event.where(active: true).last
  end
end
