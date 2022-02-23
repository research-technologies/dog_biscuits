# frozen_string_literal: true

module DogBiscuits
  module AlternativeTitle
    extend ActiveSupport::Concern

    included do
      property :alternative_title, predicate: ::RDF::Vocab::DC.alternative do |index|
        index.as :stored_searchable
      end
    end
  end
end
