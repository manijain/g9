class HomeController < ApplicationController
  before_action :must_be_admin, :only => [:request_details]

  def index
  end

  def contact
  	@request = RequestQuote.new
  end

  def submit_request_quotes
    @request = RequestQuote.new(request_params)

    respond_to do |format|
      if @request.save
        format.html { redirect_to contact_path, notice: 'Your request successfully saved' }
      else
        format.html { render action: 'contact' }
        # format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  def request_details
    @request_details = RequestQuote.all.page params[:page]
  end

  def about
  end

  def service
  end

  private

  def request_params
    params.require(:request_quote).permit(:name, :email, :phone, :message)
  end

  def must_be_admin
    unless current_user.try(:is_admin) == true
      flash[:error] = "Access denied"
      redirect_to root_path
    end
  end
end