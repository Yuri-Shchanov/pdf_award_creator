class SearchesController < ApplicationController
  def show
    @contributors = GithubAPI::Contributors.get_top_contributors(params[:url])
  end
end
