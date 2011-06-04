ActiveAdmin.register Customer do
  form do |f|
      f.inputs "Details" do
        f.input :name
        f.input :village
        f.input :contact_number
      end
      f.buttons
  end


#  filter :name , :as => :string

#  show do
#
#  end
#
  index do
    column :name
    column :village
    column :contact_number
    column "More Details" do |customer|
      link_to "view" , admin_customer_path(customer)
    end
    column "Add a new Loan" do |customer|
      link_to "Add" , new_admin_loan_path(:customer_id => customer.id)
    end
#    csv :none
  end


end
