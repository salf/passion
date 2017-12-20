class V1::CoursesController < V1::BaseController
  include ResourceActions

  private

  def klass
    Course
  end

  def resource_params
    params.require(:course).permit(:name, :author, :category_id, :state)
  end
end
