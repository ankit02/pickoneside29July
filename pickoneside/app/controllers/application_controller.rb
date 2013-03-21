class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_sidebar

def load_sidebar
  @wars = War.all
  
end



end
