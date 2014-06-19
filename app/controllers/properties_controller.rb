class PropertiesController < ApplicationController
	before_action :must_be_admin, :except => [:index, :show]
  before_action :set_tab
	# before_action :need_to_be_login, :except => [:index, :show]

  def index
    if params[:search] || params[:min_price] || params[:max_price]
      @properties = Property.search(params[:search], params[:min_price], params[:max_price]).order("created_at DESC").page params[:page]
    else
      @properties = Property.order("created_at DESC").page params[:page]
    end
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
    @property = Property.find(params[:id])
    @property_attachments = @property.property_attachments.all
	end

  def update
    @property = Property.find(params[:id])
    respond_to do |format|
      if @property.update_attributes(property_params)
        format.html { redirect_to properties_path, notice: 'Property successfully updated.' }
        # format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        # format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    Property.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to properties_path, notice: 'Property successfully deleted.' }
      # format.json { head :no_content }
    end
  end

	private

 	def property_params
    params.require(:property).permit(:title, :remote_image_url, :description, :location, :approx_price, :approx_sale_duration, property_attachments_attributes: [:id, :property_id, :avatar])
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

  def set_tab
    @selected_tab = "project_tab"
  end  
end