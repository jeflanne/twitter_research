class SearchesController < ApplicationController
  def show
    searcher =  SimpleTwitter::Search.new
    @results = searcher.search(params[:q])
  end
end
