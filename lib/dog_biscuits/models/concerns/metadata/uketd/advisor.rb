module DogBiscuits
  # thesis metadata
  module Advisor
    extend ActiveSupport::Concern

    included do
      has_and_belongs_to_many :advisor_resource,
                              class_name: 'DogBiscuits::CurrentPerson',
                              predicate: ::RDF::Vocab::MARCRelators.ths

      property :advisor, predicate: DogBiscuits::Vocab::Uketd.advisor, multiple: true do |index|
        index.as :stored_searchable, :facetable
      end

    end
  end
end