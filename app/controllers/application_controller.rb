class ApplicationController < ActionController::Base
  protect_from_forgery

  def pass_params
    @params = params
  end

  def populate_flash_errors errors
    errors.full_messages.each do |message|
      flash[message] = message
    end
  end

  def current_loan
    Loan.where(:id => params[:loan_id]).first
  end

end
