# frozen_string_literal: true

module DogBiscuits
  module AccessRight
    extend ActiveSupport::Concern

    included do
      # There is an access_rights property in Hyrax, hence the dc_
      property :access_right, predicate: ::RDF::Vocab::DC.accessRights do |index|
        index.as :stored_searchable
      end
    end
  end
end
