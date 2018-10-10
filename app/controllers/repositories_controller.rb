class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    begin
      @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
        req.params['client_id'] = '6c55858c5d9d9064f5cf'
        req.params['client_secret'] = '565e760d3084aea4d46ec6ef70a9d940b7357694'
        req.params['q'] = params[:query]
      end
      body_hash = JSON.parse(@resp.body)
      if @resp.success?
        @venues = body_hash["response"]["venues"]
      else
        @error = body_hash["meta"]["errorDetail"]
      end

      rescue Faraday::ConnectionFailed
        @error = "There was a timeout. Please try again."
      end
    render 'search'
    end
  end
end
