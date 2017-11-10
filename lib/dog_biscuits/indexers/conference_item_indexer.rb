# frozen_string_literal: true

module DogBiscuits
  class ConferenceItemIndexer < Hyrax::WorkIndexer
    include DogBiscuits::IndexesCommon

    # Add *all* properties called _resource to ensure the preflabel and altlabel of the related object
    #   are indexed in the _label solr field
    def labels_to_index
      ['creator', 'editor', 'managing_organisation', 'presented_at']
    end

    # Add string properties that have a parallel _resource property to ensure they are mixed into the _label solr field
    def strings_to_index
      ['creator', 'editor', 'presented_at']
    end

    # NB. include 'contributor' here if it is used in the form
    def contributors_to_index
      ['editor']
    end

    # Add any custom indexing into here. Method must exist, but can be empty.
    #
    # @param [Hash] solr_doc
    def do_local_indexing(solr_doc); end
  end
end
