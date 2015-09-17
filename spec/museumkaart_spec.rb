require 'spec_helper'

describe Museumkaart do

  describe ".search" do

  	context "keyword" do
	  	before(:all) do
	      VCR.use_cassette("search for nijkerk") do
	      	@results = Museumkaart.search(keyword: "historisch")
	      end

	  	end

	    it "makes http request" do
	    	expect(@results.count).to be > 0
	    end

	    it "returns museum type objects" do
	        expect(@results.first).to be_kind_of(Museumkaart::Museum)
	    end

	    it "has a name" do
	        expect(@results.first.full_title).to be_kind_of(String)
	        expect(@results.first.full_title).to include("|")
	    end
	    it "has a detail URL" do
        expect(@results.first.detail_url).to be_kind_of(String)
        expect(@results.first.detail_url).to include("/")
	    end
		end

  	context "location" do
	  	before(:all) do
	      VCR.use_cassette("search for location") do
	      	@results = Museumkaart.search(keyword: "Museum Nijkerk", latitude: "52.222687", latitude: "5.483039", distance: 3)	      	
	      end
	  	end

	    it "returns 1 object" do
	    	expect(@results.count).to be 1
	    end

	    it "returns museum type objects" do
	        expect(@results.first.full_title).to include "Museum Nijkerk"
	        puts @results.first.inspect
	    end

		end
  end

end
