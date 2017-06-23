class AppointmentsController < ApplicationController

  skip_before_action :authenticate_user!

  def new
    @appointment = Appointment.new

    @disabled_days = [Time.now]

    @artist = Artist.find(params[:artist_id])
    @message = Message.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    @appointment.artist = Artist.find(params[:artist_id])
    @appointment.start_time = params[:appointment][:start_time]
    @appointment.end_time = params[:appointment][:end_time]
    @appointment.photo = params[:appointment][:photo]
    @appointment.status = "pending"

    if @appointment.save
      @appointment.messages.create(content: params[:content],
        user: current_user, artist: @appointment.artist, from: 'user')
      redirect_to dashboard_path
    else
      render :new
    end
  end


  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to root_path
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def confirm
    @appointment = Appointment.find(params[:id])
    @appointment.status_confirmed
    @appointment.save
    redirect_to dashboard_path
  end

  def deny
    @appointment = Appointment.find(params[:id])
    @appointment.status_denied
    @appointment.save
    redirect_to dashboard_path
  end

  private

  def appointment_params
    #Add Strong Params
    params.require(:appointment).permit(:status, :photo, :photo_cache)
  end
  private

  # def string_into_date(date_to_convert)
  #     Date.strptime(date_to_convert,"%m/%d/%Y")
  # end
  # def datepicker_into_object(dates)
  #     dates.split("-").map{|date| Date.strptime(date.strip,"%m/%d/%Y")}

  # end
  # def datepicker_into_strings(dates)
  #   dates.split("-")
  # end
end
