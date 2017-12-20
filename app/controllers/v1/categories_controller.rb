class V1::CategoriesController < V1::BaseController
  include ResourceActions

  private

  def klass
    Category
  end

  def resource_params
    params.require(:category).permit(:name, :state, :vertical_id)
  end
end
