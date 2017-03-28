shared_examples_for 'date_accepted' do
  let(:model) { described_class } # the class that includes the concern

  before(:each) do
    model_str = model.to_s.split('::')[1]
    @stubby = FactoryGirl.build_stubbed(model_str.underscore.to_sym)
  end
  it 'will have accepted' do
    expect(@stubby.date_accepted).to eq('2014')
  end
  it 'will have the dc.dateAccepted predicate' do
    expect(@stubby.resource.dump(:ttl).should(include('http://purl.org/dc/terms/dateAccepted')))
  end
end