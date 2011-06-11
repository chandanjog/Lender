ActiveAdmin.register Payment do
  menu false
  form({:partial => "custom/payments/payment_details"}) do |f|
  end

#  member_action :index do
#    p "###########"*10
#    @loan_id =  params[:loan_id]
#    @payments = Payment.where(:loan_id => @loan_id)
#  end

end
