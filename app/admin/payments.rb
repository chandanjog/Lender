ActiveAdmin.register Payment do
  menu false
  filter :none
  actions :index, :new, :edit, :show, :delete, :update

  form({:partial => "custom/payments/payment_details"}) do |f|
  end

  index do
    column "Date" do |payment|
      payment.date.strftime("%d/%m/%Y")
    end
    column :amount
    default_actions
  end

  show do
    panel "Payment Details" do
      attributes_table_for payment do
        row("Date of payment") { payment.date }
        row("Amount") { payment.amount }
      end
    end

  end

  scope_to :current_loan
end
