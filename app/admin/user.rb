ActiveAdmin.register User do
  permit_params :name, :contact

  index do
    selectable_column
    id_column
    column ("Name"){|a| a.name.capitalize }
    column :contact
    column ("Joining Date"){|a| a.created_at.strftime("%d/%m/%Y") }
    actions
  end

  filter :name
  filter :contact
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :contact
    end
    f.actions
  end

end
