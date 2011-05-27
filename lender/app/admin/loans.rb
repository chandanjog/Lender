ActiveAdmin.register Loan do
  form do |f|
      f.inputs "Details" do
        f.input :amount
        f.input :rate_of_interest_per_annum
        f.input :number_of_installments
        f.input :emi
      end
      f.buttons
    end
end
