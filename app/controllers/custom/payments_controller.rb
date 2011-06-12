module Custom
  class PaymentsController < ApplicationController

    def create
      @payment = Payment.new(params[:payment])
      if @payment.save
        redirect_to admin_loans_path
      else
        populate_flash_errors @payment.errors
        redirect_to admin_new_loan_payment_path(params[:payment][:loan_id])
      end
    end

    def update
      p "@"*10
      @payment = Payment.where(:id => params[:payment_id]).first
      if @payment.update_attributes(params[:payment])
        redirect_to admin_loan_payments_path(:loan_id => params[:loan_id])
      else
        populate_flash_errors @payment.errors
        redirect_to admin_new_loan_payment_path(params[:payment][:loan_id])
      end
    end

  end
end


