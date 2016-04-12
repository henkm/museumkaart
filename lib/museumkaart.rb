require "museumkaart/version"

# Libraries
require 'open-uri'
require 'net/http'
require 'json'
require 'nokogiri'
require 'xmlsimple'

# Files
require "museumkaart/museum"

# 
# Museumkaart Module
# 

module Museumkaart
	
	BASE_URL = "http://www.museumkaart.nl/zoekresultaten.aspx"
	# keyword=
	# longitude=5.483039
	# lattitude=52.222687
	# distance=1
	# province=
	# startdate=
	# enddate=
	# lastChance=0
	# filters=
	# lFacilities=
	# mFacilities=
	# type=-1
	# card=1
	# cityName=
	# datetype=maakt%20niet%20uit
	# kidsProof=0
	
	def self.search(keyword: "", longitude: "", latitude: "", distance: 10, card: 1, city: "")
		url = "http://www.museumkaart.nl/Services/SchatkamerService.svc/GetSearchResult?&start=0&count=100&keyword=%27#{CGI::escape(keyword)}%27&city=%27#{city}%27&longitude=%27#{longitude}%27&lattitude=%27#{latitude}%27&distance=%27#{distance}%27&provinceFilter=%27%27&startdate=%27%27&enddate=%27%27&lastChance=0&filters=%27%27&lFacilities=%27%27&mFacilities=%27%27&type=0&card=1&cityName=%27%27&theme=&allMembers=&kidsProof=0"

		list = []
		doc = Nokogiri::XML(open(url))
		# puts doc.root.search("entry").count
    doc.root.search("entry").each do |entry|
    	# puts entry.to_xml
    	h = XmlSimple.xml_in(entry.to_xml.to_s.gsub("m:", "").gsub("d:", ""))
    	# {"id"=>["http://www.museumkaart.nl/Services/SchatkamerService.svc/SchatkamerKaartSet(311)"], "title"=>[{"type"=>"text"}], "updated"=>["2015-09-17T08:11:14Z"], "author"=>[{"name"=>[{}]}], "link"=>[{"rel"=>"edit", "title"=>"TreasuryCard", "href"=>"SchatkamerKaartSet(311)"}], "category"=>[{"term"=>"Museumvereniging.Shared.Treasury.TreasuryCard", "scheme"=>"http://schemas.microsoft.com/ado/2007/08/dataservices/scheme"}], 
    	# "content"=>{"type"=>"application/xml", "properties"=>[{"Id"=>[{"type"=>"Edm.Int32", "content"=>"311"}], "MuseumId"=>[{"type"=>"Edm.Int32", "content"=>"337"}], "Title"=>["HENGELO"], "SubTitle"=>["Historisch Museum Hengelo"], "Description"=>["Historisch Museum Hengelo brengt de cultuur en de geschiedenis van Hengelo in beeld. In een ruim 100 jaar oude patricirswoning toont het een gevarieerde collectie: van kunst tot gebruiksvoorwerpen."], "ImageUrl"=>["//cdn.museum.nl/cards/240x135/musnieuw/historischmuseumhengelo.jpg"], "HasPromotions"=>[{"type"=>"Edm.Boolean", "content"=>"false"}], "IsPromotion"=>[{"type"=>"Edm.Boolean", "content"=>"false"}], "IsParticipant"=>[{"type"=>"Edm.Boolean", "content"=>"true"}], "EndDate"=>[{"type"=>"Edm.DateTime", "null"=>"true"}], "DetailUrl"=>["/museum/Historisch+Museum+Hengelo/Historisch+Museum+Hengelo.aspx"], "MagazineTheme"=>[{"null"=>"true"}], "MagazineThemeTitle"=>[{"null"=>"true"}], "City"=>[{"null"=>"true"}], "Address"=>[{"null"=>"true"}], "Type"=>[{"type"=>"Edm.Int32", "content"=>"1"}], "IsKidsproof"=>[{"type"=>"Edm.Boolean", "null"=>"true"}]}]}}
    	content = h["content"]["properties"].first
    	m = Museumkaart::Museum.new(
    		id: h["id"].first.split("(").last.split(")").first.to_i,
    		title: content["Title"].first,
    		sub_title: content["SubTitle"].first,
    		description: content["Description"].first,
    		detail_url: content["DetailUrl"].first
# :detail_url, :is_participant
    		# image_url:,
    		# description:,
    		# detail_url:,
    		# is_participant:,
    		# detail_url:,
    		   		)
    	list << m
    end
    return list
	end

  # Your code goes here...
end
