class ApplicationController < ActionController::Base
  before_action :get_categories

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception



  private ##########################################################################################

  def get_categories
    @categories = Category.all
  end
end
