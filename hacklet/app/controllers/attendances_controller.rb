class AttendancesController < ApplicationController
  before_action :assert_admin

  def create
    @user = User.find(params[:user_id])
    @event = Event.find(params[:event_id])

    Attendance.create(user: @user, event: @event)
    flash[:notice] = 'Attendance marked successfully.'
    redirect_to profile_url(@user)
  end

  private
  def attendance_params
    params.require(:attendance).permit(:user, :event)
  end
end
