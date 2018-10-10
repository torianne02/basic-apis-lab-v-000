class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = '6c55858c5d9d9064f5cf'
    client_secret = '565e760d3084aea4d46ec6ef70a9d940b7357694'

    @resp = Faraday.get('https://api.github.com/search/repositories') do |req|
      req.params['q'] = params[:query]
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
    end
    body = JSON.parse(@resp.body)
    @results = body["items"]
    render :search
  end
end
