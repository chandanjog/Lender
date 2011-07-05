ActiveAdmin.register Attachment do

  filter :none

  index do
    column "File Name" do |attachment|
      link_to attachment.name, show_attachment_path(:id => 1, :file_name => attachment.name)
    end

    column "Size" do |attachment|
      attachment.size
    end

    column "" do |attachment|
      link_to 'Delete', delete_attachment_path(:id => 1, :file_name => attachment.name), :method => :delete, :confirm => "Are you sure?"
    end

  end
end
