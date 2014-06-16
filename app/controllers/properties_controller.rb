class PropertiesController < ApplicationController
	before_action :must_be_admin, :except => [:index, :show]
	before_action :need_to_be_login, :except => [:index]

	def index
		@property = Property.all
	end

	def new
		@property = Property.new
		@property.property_attachments.build
	end

	def create
		@property = Property.new(property_params)

    respond_to do |format|
      if @property.save
      	params[:property_attachments]['avatar'].each do |a|
          @property_attachment = @property.property_attachments.create!(:avatar => a, :property_id => @property.id)
       	end
        format.html { redirect_to properties_path, notice: 'Property successfully added.' }
        # format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        # format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
	end

	def show
		@property = Property.find(params[:id])
		@property_attachments = @property.property_attachments.all
	end

	def edit
	end

	private

 	def property_params
    params.require(:property).permit(:title, :remote_image_url, :description, :location, :approx_prize, :approx_sale_duration, property_attachments_attributes: [:id, :property_id, :avatar])
  end

  def must_be_admin
    unless current_user.try(:is_admin) == true
      flash[:error] = "Access denied"
      redirect_to root_path
    end
  end

  def need_to_be_login
    unless current_user
      flash[:notice] = "You need to register first"
      redirect_to new_user_registration_path
    end
  end
end