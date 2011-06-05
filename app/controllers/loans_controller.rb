class LoansController < ApplicationController

  def create
    @loan = Loan.new(params[:loan])
    if @loan.save
      redirect_to admin_loans_path
    else
      render :partial => "loan_details"
    end
  end

end