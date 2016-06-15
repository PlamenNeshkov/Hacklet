class EventPhotosController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @events = Event.all
    @event_photos = EventPhoto.where(approved: true)
  end

  def new
  end

  def create
    new_event_photos = []

    params[:photos].each do |img|
      event_photo = EventPhoto.new
      event_photo.title = params[:event_photo][:title]
      event_photo.event_id = params[:event_photo][:event_id]
      event_photo.image = img

      new_event_photos.push(event_photo)
    end

    respond_to do |format|
      new_event_photos.each do |ev_photo|
        if !ev_photo.save!
          format.html { render :new }
          format.json { render json: ev_photo.errors,
                        status: :unprocessable_entity }
          return
        end
      end

      format.html { redirect_to event_photos_url,
                    notice: 'Event photos successfully uploaded.' }

      format.json { render :index, status: :created, location: event_photos_url }
    end
  end

  def destroy
    # TODO: Implement it wisely
  end
end
