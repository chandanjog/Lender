ActiveAdmin.register Loan do

  form({:partial => "loan_details"}) do |f|
  end

  index do
    column :reference_number
    column :amount
    column "ROI/Annum",:rate_of_interest_per_annum
    column :number_of_installments
    column "EMI", :emi
    column "Customer Name" do |loan|
      loan.customer.name
    end
    column "" do |loan|
      link_to "View Details" ,admin_loan_path(loan)
    end

  end

  show do

    panel "Loan Details" do
      attributes_table_for loan do
        row("Reference Number") { loan.reference_number }
        row("Amount") { loan.amount }
        row("Rate of Interest/annum") { loan.rate_of_interest_per_annum }
        row("Number of installments") { loan.number_of_installments }
        row("emi") { loan.emi }
      end
    end

    panel "Customer Details" do
      attributes_table_for loan.customer do
        row("Name") { loan.customer.name }
        row("Village") { loan.customer.village }
        row("Contact Number") { loan.customer.contact_number }
      end
    end

    panel "Vehicle Details" do
      attributes_table_for loan.vehicle do
        row("Type") { loan.vehicle.type }
        row("Registration Number") { loan.vehicle.registration_number }
        row("Chassis Number") { loan.vehicle.chassis_number }
        row("Engine Number") { loan.vehicle.engine_number }
        row("Dealer") { loan.vehicle.dealer }
        row("Insurance Date") { loan.vehicle.insurance_date }
        row("Insurance Duration") { loan.vehicle.insurance_duration }
        row("RTO Agent") { loan.vehicle.rto_agent }
      end
    end

    active_admin_comments

  end

end
