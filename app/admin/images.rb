ActiveAdmin.register Image do
  menu :label => "Temple"
  filter :none

  index :as => :grid, :columns => 3 do |image|
     link_to(image_tag(image.path), "")
  end
end
