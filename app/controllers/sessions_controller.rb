class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:session][:username] == 'tedxunilagadmin' and  params[:session][:password] == 'quityourdayjob'
      log_in
      redirect_to dashboard_path
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
  end
end
