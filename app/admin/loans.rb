ActiveAdmin.register Loan do

  form({:partial => "custom/loans/loan_details"}) do |f|
  end

  index do
    column "Reference Number" do |loan|
      link_to loan.reference_number ,admin_loan_path(loan)
    end
    column "Customer Name" do |loan|
      loan.customer.name
    end
    column "Village" do |loan|
      loan.customer.village
    end
    column "Contact Number" do |loan|
      loan.customer.contact_number
    end
    column :amount
    column "ROI/Annum in %",:rate_of_interest_per_annum
    column :number_of_installments
    column "EMI", :emi
    column "Payments" do |loan|
      links = link_to "View", admin_loan_payments_path(loan), :class => "view_link"
      links += link_to "Add", admin_new_loan_payment_path(loan), :class => "edit_link"
      links
    end
  end

  filter :reference_number

  show do
    panel "Loan Details" do
      attributes_table_for loan do
        row("Reference Number") { loan.reference_number }
        row("Amount") { loan.amount }
        row("Rate of Interest/annum in %") { loan.rate_of_interest_per_annum }
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

    panel "Gaurantor Details" do
      attributes_table_for loan.gaurantor do
        row("Name") { loan.gaurantor.name }
        row("Village") { loan.gaurantor.village }
        row("Contact Number") { loan.gaurantor.contact_number }
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
        row("RTO Agent") { loan.vehicle.rto_agent }
      end
    end

    active_admin_comments
  end

end
