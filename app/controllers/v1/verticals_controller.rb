class V1::VerticalsController < V1::BaseController
  include ResourceActions

  private

  def klass
    Vertical
  end

  def resource_params
    params.require(:vertical).permit(:name)
  end
end
