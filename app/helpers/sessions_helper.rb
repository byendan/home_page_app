module SessionsHelper
  
  
  
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
    session[:active_sheet] = Sheet.new
  end
  
  # Sets the active sheet
  def set_active_sheet(new_sheet)
    session[:active_sheet] = new_sheet
  end
  
  # Returns active sheet
  def active_sheet
    return Sheet.find_by(id: session[:active_sheet])
  end
  
  # Sets screen size, mobile if true
  def set_session_size(size_bool)
    session[:mobile] = size_bool
  end
  
  # Gets mobile size
  def get_screen_size
    return session[:mobile]
  end
  
  def any_sheets?
    return current_user.sheets != nil
  end
  
  # Remembers a user in a persistent session.
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end
  
  # Returns the current logged-in user if any
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end
  
  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end
  
  
  # Logs out the current user.
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  # Sets returns the tab and link info
  def page_data
    if logged_in?
      
      @page_data = Hash.new
      
      @sheets = current_user.sheets.all
      @sheet = Sheet.new
      @tab = Tab.new
      unless @sheets.empty?
        @sheets.each do |s|
          @page_data[s] = s.tabs.all
        end
      end
    end
  end
  
  
  
  
  
  

end
