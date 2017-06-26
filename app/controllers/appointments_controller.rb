class AppointmentsController < ApplicationController


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
    @appointment.message = params[:appointment][:message]

    if @appointment.save
      @chatroom = Chatroom.create(appointment_id: @appointment.id,
        user_id: @appointment.user.id, artist_id: @appointment.artist.id)
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
    @appointment = Appointment.find[params[:id]]
  end

  private



  def overlap?(start_time, end_time)
    start_time = string_into_date(start_time)
    end_time = string_into_date(end_time)
    (string_into_date(appointment.start_time)...string_into_date(appointment.end_time)).overlaps?(start_time...end_time)
  end


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
