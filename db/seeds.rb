# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Image.create(:path=>"balaji1.jpg")
Image.create(:path=>"ram.jpg")
Image.create(:path=>"sai.jpg")
Image.create(:path=>"Shree_Laxmi_Narayan_Ji_Wallpaper.jpg")
Image.create(:path=>"vaishnavdevi.jpg")
Image.create(:path=>"Image082.jpg")


ref_no = 1
while(ref_no != 6) do
  customer = Person.new(:name => "chandu", :village=>"nagpur", :contact_number => "8800493714", :role=>"customer")
  gaurantor = Person.new(:name => "andu", :village=>"indu", :contact_number => "8800493714", :role=>"gaurantor")
  vehicle = Vehicle.new(:model => "sumo", :registration_number => "MH-12CX10")

  loan = Loan.create(:reference_number => ref_no, :amount=>"10000",:rate_of_interest_per_annum =>20, :active => true,
                     :number_of_installments => 10, :installment_term => 1 , :emi=>1000,
                     :customer => customer, :gaurantor => gaurantor, :vehicle => vehicle,
                     :created_at => DateTime.now - 4.months )
  p "after create #{loan.errors}"
  ref_no = ref_no + 1
end

