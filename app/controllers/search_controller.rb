class SearchController < ApplicationController
  
  def index
    redirect_to :action => :new
  end

  def new
    @search = Search.new params[:search]
  end
  
  def results
    @search = Search.new params[:search]
    if @search.query.blank?
      redirect_to :action => :new
      return
    end

    @web_results = @search.web_results
    @web_pagination = WillPaginate::Collection.new @search.page, @search.per_page, @web_results.deephits
    @web_pagination.replace(@web_results.results)
    
    if @search.page < 3
      @wikipedia_results = @search.wikipedia_results :count => 3, :start => 0, :abstract => "short"    
      @image_results = @search.image_results :count => 3, :start => 0
      @news_results = @search.news_results :count => 3, :start => 0
    end
  end
  
end
