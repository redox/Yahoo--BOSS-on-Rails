class Search < ActiveForm
  
  attr_accessor :query
  attr_writer :page, :per_page, :language, :orig_country
  
  def web_results(refines = [], params = {})
    refines << self.query
    BOSSMan::Search.web refines.join(' '), {
      :count => self.per_page,
      :start => start,
      :abstract => "long",
      :view => "language,keyterms",
      :lang => language,
      :region => orig_country
    }.update(params)
  end
  
  def wikipedia_results(params = {})
    web_results(["site:wikipedia.org"], params)
  end
  
  def image_results(params = {})
    BOSSMan::Search.images self.query, {
      :count => self.per_page,
      :start => start,
      :abstract => "long",
      :view => "language,keyterms",
      :lang => language,
      :region => orig_country
    }.update(params)    
  end

  def news_results(params = {})
    BOSSMan::Search.news self.query, {
      :count => self.per_page,
      :start => start,
      :order => "date",
      :age => "7d",
      :abstract => "short",
      :view => "language",
      :lang => language,
      :region => orig_country
    }.update(params)    
  end  

  def page
    (@page || 1).to_i
  end
  
  def per_page
    (@per_page || 10).to_i
  end
  
  def language
    @language || "fr"
  end
  
  def orig_country
    @orig_country || "fr"
  end
  
  def start
    per_page * (page - 1)
  end
  
end
