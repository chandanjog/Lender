class ApplicationController < ActionController::Base
  protect_from_forgery

  def pass_params
    @params = params
  end

end
