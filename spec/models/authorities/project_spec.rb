require 'spec_helper'
require 'active_fedora'
require 'hydra/works'
require 'action_view'

describe DogBiscuits::Project do
  
  let(:project) { FactoryGirl.build(:project) }
  
  it_behaves_like 'identifier'

  it 'is a project' do
    expect(project).to be_project
  end

  # test metadata properties
  describe '#metadata' do
    specify { project.type.should include('http://xmlns.com/foaf/0.1/Project') }
    specify { project.name.should eq('A scientific study into misery') }
    specify { project.funder.should eq(['funder']) }
  end

  it 'gets a preflabel from given and family name' do
    project.add_preflabel
    expect(project.preflabel).to eq('A scientific study into misery (id: identifier_test)')
  end

  # test predicates sent to fedora
  describe '#predicates' do
    specify { project.resource.dump(:ttl).should include('http://purl.org/dc/terms/identifier') }
    specify { project.resource.dump(:ttl).should include('http://xmlns.com/foaf/0.1/name') }
    specify { project.resource.dump(:ttl).should include('http://id.loc.gov/vocabulary/relators/fnd') }
  end
end