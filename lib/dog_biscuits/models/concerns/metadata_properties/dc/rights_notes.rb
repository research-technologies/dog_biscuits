# frozen_string_literal: true

module DogBiscuits
  module RightsNotes
    extend ActiveSupport::Concern

    included do
      property :rights_notes, predicate: ::RDF::URI.new('http://purl.org/dc/elements/1.1/rights') do |index|
        index.as :stored_searchable
      end
    end
  end
end
