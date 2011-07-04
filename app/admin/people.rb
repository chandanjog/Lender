ActiveAdmin.register Person do
  index do
    column :name
    column :village
    column :role
    column "Contact Nos." do |person|
      secondary_contact = person.contact_number_secondary.blank? ? "" : ", #{person.contact_number_secondary}"
      contact = person.contact_number + secondary_contact
      contact
    end
    column "Associated loan" do |person|
      link = link_to "View", admin_loan_path(person.loan), :class => "view_link"
      link
    end
  end

  filter :name
  filter :village
  filter :role
  filter :contact_number
  filter :contact_number_secondary

end
