module Museumkaart

  class Museum
    attr_accessor :id, :title, :sub_title, :image_url, :description, :detail_url, :is_participant

    # MuseumId:
    # - type: Edm.Int32
    #   content: '337'
    # Title:
    # - HENGELO
    # SubTitle:
    # - Historisch Museum Hengelo
    # Description:
    # - 'Historisch Museum Hengelo brengt de cultuur en de geschiedenis van Hengelo
    #   in beeld. In een ruim 100 jaar oude patricirswoning toont het een gevarieerde
    #   collectie: van kunst tot gebruiksvoorwerpen.'
    # ImageUrl:
    # - //cdn.museum.nl/cards/240x135/musnieuw/historischmuseumhengelo.jpg
    # HasPromotions:
    # - type: Edm.Boolean
    #   content: 'false'
    # IsPromotion:
    # - type: Edm.Boolean
    #   content: 'false'
    # IsParticipant:
    # - type: Edm.Boolean
    #   content: 'true'
    # EndDate:
    # - type: Edm.DateTime
    #   'null': 'true'
    # DetailUrl:
    # - /museum/Historisch+Museum+Hengelo/Historisch+Museum+Hengelo.aspx
    # MagazineTheme:
    # - 'null': 'true'
    # MagazineThemeTitle:
    # - 'null': 'true'
    # City:
    # - 'null': 'true'
    # Address:
    # - 'null': 'true'
    # Type:
    # - type: Edm.Int32
    #   content: '1'
    # IsKidsproof:
    # - type: Edm.Boolean
    #   'null': 'true'

  

    #
    # Initializer to transform a +Hash+ into an Tip object
    #
    # @param [Hash] args


    def initialize(args=nil)
      return if args.nil?
      args.each do |k,v|
        instance_variable_set("@#{k}", v) unless v.nil?
      end
      # typecast_attrs
    end

    def full_title
      "#{title} | #{sub_title}"
    end

  end
end
