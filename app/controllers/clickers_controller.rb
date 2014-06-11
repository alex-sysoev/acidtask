class ClickersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  #All clickers
  def index
    @clickers = Clicker.sorted
  end

  #Create Clicker
  def create
    success = false
    error   = ''
    status  = 404

    if !params[:name].nil? #&& !params[:signature].nil? && Clicker.verify_signature(params[:name],params[:signature])
      params.merge!( { ip: request.remote_ip } )
      clicker = Clicker.new( clicker_params )
      if clicker.save
        success = true
        status  = 200
      else
        status  = 500
        error   = 'Failed to save clicker'
      end
    else
      status = 403
      error  = 'Failed to get name'
    end

    #Rendering response
    respond_to do |format|
      format.html { render nothing: true, status: status }
      format.json { render json: { success: success, error: error }, status: status }
    end

  end

  protected

  def clicker_params
    params.permit( :name, :ip )
  end

end
