# frozen_string_literal: true

module DogBiscuits
  module ExtendedSolrDocument
    extend ActiveSupport::Concern

    # Duplicated from https://github.com/samvera/hyrax/blob/master/app/models/concerns/hyrax/solr_document/metadata.rb

    class_methods do
      def attribute(name, type, field)
        define_method name do
          type.coerce(self[field])
        end
      end

      def solr_name(*args)
        ActiveFedora.index_field_mapper.solr_name(*args)
      end
    end

    module Solr
      class Array
        # @return [Array]
        def self.coerce(input)
          ::Array.wrap(input)
        end
      end

      class String
        # @return [String]
        def self.coerce(input)
          ::Array.wrap(input).first
        end
      end

      class Date
        # @return [Date]
        def self.coerce(input)
          field = String.coerce(input)
          return if field.blank?
          begin
            ::Date.parse(field)
          rescue ArgumentError
            Rails.logger.info "Unable to parse date: #{field.first.inspect}"
          end
        end
      end
    end

    # Keep these alphebetized; comments indicate those in basic_metadata
    #   see https://github.com/samvera/hyrax/blob/master/app/models/concerns/hyrax/solr_document/metadata.rb
    included do
      attribute :abstract, Solr::Array, solr_name('abstract')
      attribute :access_provided_by, Solr::Array, solr_name('access_provided_by')
      # access_right
      attribute :advisor, Solr::Array, solr_name('advisor')
      attribute :alt, Solr::Array, solr_name('alt')
      #alternative_title
      attribute :awarding_institution, Solr::Array, solr_name('awarding_institution')
      # based_near and based_near
      attribute :content_version, Solr::Array, solr_name('content_version')
      # contributor
      # creator
      attribute :date, Solr::Array, solr_name('date')
      attribute :date_accepted, Solr::Array, solr_name('date_accepted')
      attribute :date_available, Solr::Array, solr_name('date_available')
      attribute :date_collected, Solr::Array, solr_name('date_collected')
      attribute :date_copyrighted, Solr::Array, solr_name('date_copyrighted')
      attribute :date_issued, Solr::Array, solr_name('date_issued')
      # date_created
      attribute :date_of_award, Solr::Array, solr_name('date_of_award')
      attribute :date_published, Solr::Array, solr_name('date_published')
      attribute :date_submitted, Solr::Array, solr_name('date_submitted')
      attribute :date_updated, Solr::Array, solr_name('date_updated')
      attribute :date_valid, Solr::Array, solr_name('date_valid')
      attribute :dc_access_rights, Solr::Array, solr_name('dc_access_rights')
      attribute :department, Solr::Array, solr_name('department')
      # description
      attribute :doi, Solr::Array, solr_name('doi')
      attribute :edition, Solr::Array, solr_name('edition')
      attribute :editor, Solr::Array, solr_name('editor')
      attribute :end_date, Solr::Array, solr_name('end_date')
      attribute :event_date, Solr::Array, solr_name('event_date')
      attribute :extent, Solr::Array, solr_name('extent')
      attribute :dc_format, Solr::Array, solr_name('dc_format')
      attribute :former_identifier, Solr::Array, solr_name('former_identifier')
      attribute :funder, Solr::Array, solr_name('funder')
      attribute :resource_type_general, Solr::Array, solr_name('resource_type_general')
      attribute :has_restriction, Solr::Array, solr_name('has_restriction')
      # rubocop:enable Naming/PredicateName

      # identifier
      attribute :isbn, Solr::Array, solr_name('isbn')
      attribute :issue_number, Solr::Array, solr_name('issue_number')
      # keyword
      # language
      attribute :last_access, Solr::Array, solr_name('last_access')
      attribute :lat, Solr::Array, solr_name('lat')
      # license
      attribute :location, Solr::Array, solr_name('location')
      attribute :long, Solr::Array, solr_name('long')
      attribute :managing_organisation, Solr::Array, solr_name('managing_organisation')
      attribute :module_code, Solr::Array, solr_name('module_code')
      attribute :note, Solr::Array, solr_name('note')
      attribute :number_of_downloads, Solr::Array, solr_name('last_access')
      attribute :official_url, Solr::Array, solr_name('official_url')
      attribute :output_of, Solr::Array, solr_name('output_of')
      attribute :official_url, Solr::Array, solr_name('official_url')
      attribute :packaged_by_ids, Solr::Array, solr_name('packaged_by_ids', :symbol)
      attribute :package_ids, Solr::Array, solr_name('package_ids', :symbol)
      attribute :pagination, Solr::Array, solr_name('pagination')
      attribute :part, Solr::Array, solr_name('part')
      attribute :place_of_publication, Solr::Array, solr_name('place_of_publication')
      attribute :presented_at, Solr::Array, solr_name('presented_at')
      attribute :part_of, Solr::Array, solr_name('part_of')
      attribute :project, Solr::Array, solr_name('project')
      attribute :publication_status, Solr::Array, solr_name('publication_status')
      # publisher
      attribute :qualification_level, Solr::Array, solr_name('qualification_level')
      attribute :qualification_name, Solr::Array, solr_name('qualification_name')
      attribute :refereed, Solr::Array, solr_name('refereed')
      attribute :related_url, Solr::Array, solr_name('related_url')
      # resource_type
      # rights_notes
      # rights_statement
      attribute :series, Solr::Array, solr_name('series')
      # source
      attribute :start_date, Solr::Array, solr_name('start_date')
      # subject
      attribute :subtitle, Solr::Array, solr_name('subtitle')
      attribute :volume_number, Solr::Array, solr_name('volume_number')
      # archivematica
      attribute :aip_uuid, Solr::Array, solr_name('aip_uuid')
      attribute :transfer_uuid, Solr::Array, solr_name('transfer_uuid')
      attribute :sip_uuid, Solr::Array, solr_name('sip_uuid')
      attribute :dip_uuid, Solr::Array, solr_name('dip_uuid')
      attribute :aip_status, Solr::Array, solr_name('aip_status')
      attribute :dip_status, Solr::Array, solr_name('dip_status')
      attribute :aip_size, Solr::Array, solr_name('aip_size')
      attribute :dip_size, Solr::Array, solr_name('dip_size')
      attribute :aip_current_path, Solr::Array, solr_name('aip_current_path')
      attribute :dip_current_path, Solr::Array, solr_name('dip_current_path')
      attribute :aip_current_location, Solr::Array, solr_name('aip_current_location')
      attribute :dip_current_location, Solr::Array, solr_name('dip_current_location')
      attribute :aip_resource_uri, Solr::Array, solr_name('aip_resource_uri')
      attribute :dip_resource_uri, Solr::Array, solr_name('dip_resource_uri')
      attribute :origin_pipeline, Solr::Array, solr_name('origin_pipeline')
    end
  end
end
