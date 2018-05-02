class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    url = 'https://api.github.com/search/repositories'
    @resp = Faraday.get(url) do |req|
      req.params['client_id'] = 'xxxxxx'
      req.params['client_secret'] = 'xxxxx'
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = body["message"]
    end
    render 'search'
  end
end
