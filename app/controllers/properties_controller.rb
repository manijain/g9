class PropertiesController < ApplicationController
	before_action :must_be_buyer, :except => [:index, :show, :show_contact_count]
  before_action :premium_member_plan, :only => [:new, :create]
  before_action :set_tab

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
    @property.user_id = current_user.id
    current_user.update_attributes(:count_property => current_user.count_property + 1)

    respond_to do |format|
      if @property.save
      	params[:property_attachments]['avatar'].each do |a|
          @property_attachment = @property.property_attachments.create!(:avatar => a, :property_id => @property.id)
       	end
        User.all.each do |user|
          HTTParty.get('http://api.mvaayoo.com/mvaayooapi/MessageCompose?', :query => {:user => 'manijain333@gmail.com:pinkcity',:senderID => 'TEST SMS' ,:receipientno => user.phone, :msgtxt => 'Hello!! we added one New Property. check it out at http://g9-builders.herokuapp.com. Thank you.' })
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
		@property_attachments = @property.property_attachments.find(:all, :limit => 5)
    @comment = Comment.new
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

  def show_contact_count
    if user_signed_in? && current_user.count_property_contact <= 5 
      @property = Property.find(params[:id])
      current_user.update_attributes(:count_property_contact => current_user.count_property_contact + 1)
      msg = "Phone# #{@property.user.phone} : #{5 - current_user.count_property_contact.to_i} property contact left to view" 
    else
      msg = "Please Sign In or Buy Membership plan"
    end
    render :json => msg
  end

	private

 	def property_params
    params.require(:property).permit(:title, :remote_image_url, :description, :location, :approx_price, :approx_sale_duration, :user_id, property_attachments_attributes: [:id, :property_id, :avatar])
  end

  def must_be_buyer
    unless current_user.phone.present?
      flash[:error] = "Access denied !! You need to complete your profile first"
      redirect_to edit_user_registration_path(current_user)
    end
  end

  def premium_member_plan
    unless current_user.count_property < 6
      flash[:notice] = "You have reached your maximumn limit. You need to take premium member plan for publish unlimited property"
      redirect_to service_path
    end
  end

  def set_tab
    @selected_tab = "project_tab"
  end  
end