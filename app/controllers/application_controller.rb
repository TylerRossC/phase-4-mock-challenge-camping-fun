class ApplicationController < ActionController::API
  include ActionController::Cookies
  rescue_from ActiveRecord::RecordInvalid, with: :creation_unsuccessful

  private 

  def creation_unsuccessful(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end
end
