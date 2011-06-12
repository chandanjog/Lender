module Custom
  class LoansController < ApplicationController

    def create
      @loan = Loan.new(params[:loan])
      if @loan.save
        redirect_to admin_loans_path
      else
        p @loan.errors
        render :partial => "loan_details"
      end
    end

    def update
      @loan = Loan.where(:id => params[:id]).first
      if @loan.update_attributes(params[:loan])
        redirect_to admin_loans_path
      else
        p @loan.errors
        render :partial => "loan_details"
      end
    end

  end
end
