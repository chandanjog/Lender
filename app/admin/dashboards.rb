ActiveAdmin::Dashboards.build do
  section "Defaulter Cases, Sorted on the least payments made ", :priority => 1 do
    table_for Loan.all_with_pending_payments do
      column("Ref Number")   {|loan| link_to(loan.reference_number.to_s , admin_loan_path(loan) )}
      column("Customer Name")   {|loan| loan.customer.name }
      column("Village")   {|loan| loan.customer.village }
      column("Contact Number")   {|loan| loan.customer.contact_number }
      column("Payments")   {|loan| link_to( "View" , admin_loan_payments_path(loan)) }
    end

  end

end
