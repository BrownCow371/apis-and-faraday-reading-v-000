class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
      req.params['client_id'] = "I0PLV11P0WDR1D44YKAR3U3KE1SLVFGL2M2MHRK0III3ZSI1"
      req.params['client_secret'] = "U2RS3G2BKR1XDSXEY2H0VEIE0WVLM2YMXODZP343JIWM4H2D"
      req.params['v'] = '20160201'
      req.params['near'] = params[:zipcode]
      req.params['query'] = 'coffee shop'
    end

    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
  end
 end
