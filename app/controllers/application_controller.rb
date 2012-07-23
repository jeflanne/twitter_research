class ApplicationController < ActionController::Base
  respond_to(:html, :json)
  before_filter :authenticate_user!
  protect_from_forgery
end
