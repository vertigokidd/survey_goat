helpers do
  # This will return the current user, if they exist
  # Replace with code that works with your application
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end

  # Returns true if current_user exists, false otherwise
  def logged_in?
    !current_user.nil?
  end

  def make_url
    url = ("A".."Z").to_a + ("a".."z").to_a + ("1".."9").to_a
    url.sample(5).join
  end

end
