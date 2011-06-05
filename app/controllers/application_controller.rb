class ApplicationController < ActionController::Base
  protect_from_forgery

  def pass_params
    p "in paaaaaaaaas params"
    p params
    @params = params
  end

end
