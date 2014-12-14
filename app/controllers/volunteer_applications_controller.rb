class VolunteerApplicationsController < ApplicationController

  before_action :logged_in_user, only: :index

  def new
    @volunteer_application = VolunteerApplication.new
  end

  def create
    @volunteer_application = VolunteerApplication.new(volunteer_application_params)
    if @volunteer_application.save
      redirect_to thanks_path
    else
      render 'new'
    end
  end

  def index
    if params[:q] == 'accepted'
      @volunteer_applications = VolunteerApplication.order(created_at: :desc).accepted.page(params[:page]) #accepted applications
    elsif params[:q]
      @volunteer_applications = VolunteerApplication.order(created_at: :desc).search(params[:q]).page(params[:page]) #searched applications
    else
      @volunteer_applications = VolunteerApplication.order(created_at: :desc).page(params[:page]) #all applications
    end
  end

  def accept
    @volunteer_application = VolunteerApplication.find(params[:id])
    @volunteer_application.accept!
    @volunteer_application.save!

    respond_to do |format|
      format.js
      format.html{ redirect_to dashboard_path}
    end
  end

  def revoke
    @volunteer_application = VolunteerApplication.find(params[:id])
    @volunteer_application.revoke!
    @volunteer_application.save!

    respond_to do |format|
      format.js
      format.html{ redirect_to dashboard_path}
    end
  end

  private
    def volunteer_application_params
      params.require(:volunteer_application).permit(:name, :email, :course, :year, :interest, :reason)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = 'Please log in.'
        redirect_to login_url
      end
    end
end
