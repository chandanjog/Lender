ActiveAdmin.register Loan do
  p "###"*10
#  p params

  form do |f|

      p "$"*10
#      p params[:customer_id]

      f.inputs "Loan Details" do
        f.input :amount
        f.input :rate_of_interest_per_annum
        f.input :number_of_installments
        f.input :emi
      end

      f.inputs "Customer Details" do
        f.input :customer
      end

      f.inputs "Vehicle Details" do
#        f.input :vehicle
      end
      f.buttons

#      f.input :customer
#      f.buttons

  end

  filter :none

  index do
    column :id
    column :amount
    column "ROI/Annum",:rate_of_interest_per_annum
    column :number_of_installments
    column "EMI", :emi
    column :customer
    column :vehicle
  end

end
