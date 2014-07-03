ActiveAdmin.register User do
  permit_params :email, :password, :password_confirmation, :name, :gender, :address, :city, :phone, :occupation
  
  filter :name
  filter :email
  filter :city

  # actions :only => [:index]
  # actions :all, :except => [:destroy, :new]

  index do
    id_column
    column :name
    column :email
    column :city
    column :occupation
    actions
  end

  form do |f|
    f.inputs :name
    f.inputs :email
    f.inputs :password
    f.inputs :password_confirmation
    f.inputs :gender
    f.inputs :address
    f.inputs :city
    f.inputs :phone
    f.inputs :occupation
    f.actions
  end


 # show do
 #    h3 user.name
 #    div do
 #      user.email
 #    end
 #  end

  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  index :download_links => false

  config.per_page = 10
end