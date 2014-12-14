module SessionsHelper
    # Logs in the given user.
  def log_in
    session[:logged_in] = true
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    session[:logged_in]
  end
end
