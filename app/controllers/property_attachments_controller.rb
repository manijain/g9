class PropertyAttachmentsController < ApplicationController
  before_action :set_property_attachment, only: [:show, :edit, :update, :destroy]

  # GET /property_attachments
  # GET /property_attachments.json
  def index
    @property_attachments = PropertyAttachment.all
  end

  # GET /property_attachments/1
  # GET /property_attachments/1.json
  def show
  end

  # GET /property_attachments/new
  def new
    @property_attachment = PropertyAttachment.new
  end

  # GET /property_attachments/1/edit
  def edit
  end

  # POST /property_attachments
  # POST /property_attachments.json
  def create
    @property_attachment = PropertyAttachment.new(property_attachment_params)

    respond_to do |format|
      if @property_attachment.save
        format.html { redirect_to @property_attachment, notice: 'Property attachment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @property_attachment }
      else
        format.html { render action: 'new' }
        format.json { render json: @property_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /property_attachments/1
  # PATCH/PUT /property_attachments/1.json
  def update
    respond_to do |format|
      if @property_attachment.update(property_attachment_params)
        format.html { redirect_to @property_attachment, notice: 'Property attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @property_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_attachments/1
  # DELETE /property_attachments/1.json
  def destroy
    @property_attachment.destroy
    respond_to do |format|
      format.html { redirect_to property_attachments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_attachment
      @property_attachment = PropertyAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_attachment_params
      params.require(:property_attachment).permit(:property_id, :avatar)
    end
end
