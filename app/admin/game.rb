ActiveAdmin.register Game do
  permit_params :name

  index do
    selectable_column
    id_column
    column ("Name"){|a| a.name.capitalize }
    column ("Created on"){|a| a.created_at.strftime("%d/%m/%Y") }
    actions
  end

  filter :name
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

end
