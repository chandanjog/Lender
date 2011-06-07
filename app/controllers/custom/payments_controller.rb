module Custom
  class PaymentsController < ApplicationController

  layout :active_admin

  def index
    @loan_id =  params[:loan_id]
    @loan_payments = Payment.where(:loan_id => @loan_id)
    render :partial => "index"
  end

  def create
    @payment = Payment.new(params[:payment])
    if @payment.save
      redirect_to admin_loans_path
    else
      render :partial => "payment_details"
    end
  end

end
end


