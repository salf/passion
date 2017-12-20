shared_examples_for 'resource actions' do |factory|
  let!(:resource)       { create(factory) }
  let(:resource_class)  { factory.to_s.humanize.constantize }

  describe 'GET :index' do
    before { get :index }

    it { expect(response).to have_http_status(:ok) }

    it 'returns correct JSON' do
      expect(json).to be_instance_of(Array)
      expect(json.first['id']).to eq(resource.id)
    end
  end

  describe 'GET :show' do
    before { get :show, params: { id: resource.id } }

    it { expect(response).to have_http_status(:ok) }

    it 'returns correct JSON' do
      expect(json['id']).to eq(resource.id)
    end
  end

  describe 'POST :create' do # checks what code does as a result
    let(:valid_params)    { { factory => build(factory).attributes } }
    let(:invalid_params1) { { factory => { name: '' } } }
    let(:invalid_params2) { { data: { name: 'Child' } } }
    subject { post :create, params: params }

    context 'when valid params' do
      let(:params) { valid_params }
      it "creates a new #{factory}" do
        expect { subject }.to change(resource_class, :count).by(1)
      end

      it "respond with new #{factory}" do
        subject
        expect(response).to have_http_status(:created)
        expect(json['id']).to eq(resource_class.last.id)
      end
    end

    context 'when invalid params #1' do
      let(:params) { invalid_params1 }
      let(:expected_errors) { ["can't be blank"] }

      it "respond with errors for the new #{factory}" do
        subject
        expect(response).to have_http_status(:unprocessable_entity)
        expect(json['name']).to eq(expected_errors)
      end
    end

    context 'when invalid params #2' do
      let(:params) { invalid_params2 }

      it "raises exception for missed param" do
        expect { subject }.to raise_error(ActionController::ParameterMissing)
      end
    end
  end

  describe 'PUT :update' do # checks how code does
    let(:valid_params)    { { factory => { name: 'new-name'} } }
    let(:invalid_params1) { { factory => { name: '' } } }
    let(:invalid_params2) { { data: { name: 'Child' } } }

    let(:permitted_params) { ActionController::Parameters.new(params[factory]).permit! }
    before { expect(resource_class).to receive(:find).with(params[:id].to_s).and_return(resource) }
    subject { post :update, params: params }

    context 'when updates successfully' do
      let(:params) { valid_params.merge(id: resource.id) }
      it "respond with #{factory}" do
        expect(resource).to receive(:update).with(permitted_params).and_return(true)
        expect(controller).to receive(:render).with(json: resource)
        subject
      end
    end

    context 'when update fails' do
      let(:params) { invalid_params1.merge(id: resource.id) }
      it "respond with #{factory} errors" do
        expect(resource).to receive(:update).with(permitted_params).and_return(false)
        expect(controller).to receive(:render).with(json: resource.errors, status: :unprocessable_entity)
        subject
      end
    end
  end

  describe 'DELETE :destroy' do
    subject { delete :destroy, params: { id: resource.id } }
    it "destroys the requested #{factory}" do
      expect { subject }.to change(resource_class, :count).by(-1)
    end
  end

  describe '#klass' do
    subject { controller.send(:klass) }

    it { expect(subject).to eq(resource_class) }
  end
end
