ActiveAdmin.register Customer do
  form do |f|
      f.inputs "Details" do
        f.input :name
        f.input :village
        f.input :contact_number
      end
      f.buttons
    end
end
