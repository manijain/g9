ActiveAdmin.register Property do
  permit_params :title, :description, :location, :approx_price, :approx_sale_duration, :status
  menu :label => "Available Property"

  filter :title
  filter :location
  filter :approx_price

  index do
    id_column
    column :title
    column :location
    column :status
    column :approx_price do |property|
      number_with_delimiter property.approx_price
    end
    column :created_at
    actions
  end
  
  form do |f|
    f.inputs :title
    f.inputs :location
    f.inputs :status
    f.inputs :approx_price
    f.inputs :approx_sale_duration

    f.actions
  end

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

  # index :download_links => [:pdf]
  config.per_page = 10

  index :download_links => false
end