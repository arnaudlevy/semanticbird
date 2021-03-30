class ApplicationController < ActionController::Base
  add_breadcrumb 'Home', :root_path

  def index
  end
end
