class AppointmentsController < ApplicationController

  def new
    @appointment = Appointment.new
    @artist = Artist.find(params[:artist_id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    # @appointment.artist = Artist.find(params[:artist_id])

    @appointment.save
      if @appointment.save
        redirect_to root_path
      else
        @error = "You did not save mate"
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

  def appointment_params
    #Add Strong Params
    params.require(:appointment).permit(:status)
  end
end
