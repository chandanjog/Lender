module Custom
  class LoansController < ApplicationController

    def create
      @loan = Loan.new(params[:loan])
      if @loan.save
        redirect_to admin_loans_path
      else
        populate_flash_errors @loan.errors
        redirect_to new_admin_loan_path
      end
    end

    def update
      @loan = Loan.where(:id => params[:id]).first
      if @loan.update_attributes(params[:loan])
        redirect_to admin_loans_path
      else
        populate_flash_errors @loan.errors
#        p @loan.errors.full_messages
#        flash[:error] = @loan.errors.full_messages
        redirect_to edit_admin_loan_path(@loan)
      end
    end

  end
end
