require 'barby/barcode/qr_code'
require 'barby/outputter/cairo_outputter'

class QrCodesController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])

    @barcode = Barby::QrCode.new(create_attendance_url(@event, @user))

    @outputter = Barby::CairoOutputter.new(@barcode)
    @outputter.xdim = 20

    @blob = @outputter.to_png

    respond_to do |format|
      format.png do
        send_data @blob, type: "image/png", disposition: "inline"
      end
    end
  end
end
