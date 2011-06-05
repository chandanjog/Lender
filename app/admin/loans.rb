ActiveAdmin.register Loan do

  form({:partial => "loan_details"}) do |f|
  end

#  member_action :new do
#   @customer_id = params["customer_id"]
#   render
#  end

  filter :none

  index do
    column :id
    column :amount
    column "ROI/Annum",:rate_of_interest_per_annum
    column :number_of_installments
    column "EMI", :emi
    column :customer
    column "Vehicle" do |vehicle|
      link_to "Details" , admin_vehicle_path(vehicle)
    end
  end

end
