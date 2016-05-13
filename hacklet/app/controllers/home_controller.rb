class HomeController < ApplicationController
  def index
    @event = Event.where(active: true).last
    @sponsors = Sponsor.all
  end
end
