module ResourceActions
  extend ActiveSupport::Concern

  def index
    data = klass.all
    render json: data
  end

  def show
    render json: resource
  end

  def create
    resource = klass.new(resource_params)
    if resource.save
      render json: resource, status: :created
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  def update
    if resource.update(resource_params)
      render json: resource
    else
      render json: resource.errors, status: :unprocessable_entity
    end
  end

  def destroy
    resource.destroy
  end

  def resource
    @resource ||= klass.find(params[:id])
  end
end