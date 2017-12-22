class V1::BaseController < ApplicationController
  GOOGLE_AUTH_URL = 'auth/google_oauth2'.freeze

  before_action :set_user_by_token

  def set_user_by_token
    @token = request.headers['access-token'] || params['access-token']
    return render_unauthorized unless @token && current_user
  end

  def current_user
    @current_user ||= User.find_by(access_token: @token)
  end

  private

  def render_unauthorized
    location = "#{request.protocol}#{request.host_with_port}/#{GOOGLE_AUTH_URL}"
    render json: {
      message: 'You must authenticate to continue using API',
      location: location
    }, status: :unauthorized
  end
end
