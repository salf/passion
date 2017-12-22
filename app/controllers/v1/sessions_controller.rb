class V1::SessionsController < V1::BaseController
  skip_before_action :set_user_by_token, only: [:create]

  def create
    @user = User.from_omniauth(request.env['omniauth.auth'])
    render json: { token: @user.access_token, message: 'You have successfully logged in' }
  end

  def destroy
    current_user.update(access_token: nil)
    render json: { message: 'Successfully logged out' }
  end
end
