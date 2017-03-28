module DogBiscuits
  # current person (not historical)
  class CurrentPerson < DogBiscuits::Agent
    include DogBiscuits::FoafNameParts,
            DogBiscuits::Pure,
            DogBiscuits::RdfType,
            DogBiscuits::Orcid

    before_save :add_pure_type, :add_preflabel

    type [::RDF::URI.new('http://schema.org/Person'),
          ::RDF::Vocab::FOAF.Agent,
          ::RDF::Vocab::FOAF.Person]

    def add_pure_type
      rdf_type << DogBiscuits::Vocab::PureTerms.Person unless pure_uuid.nil?
    end

    def current_person?
      true
    end

    def phd
      rdf_type << DogBiscuits::Vocab::PureTerms.PhdStudent
    end

    # Create a preflabel from the name in Family, Given form
    #   if family and given exist, overwrite existing preflabel
    def add_preflabel
      unless family_name.blank?
        label = family_name
      end

      unless given_name.blank?
        if label.nil?
          label = given_name
        else
          label += ", #{given_name}"
        end
      end

      unless label.blank?
        self.preflabel = label
      end
    end
  end
end