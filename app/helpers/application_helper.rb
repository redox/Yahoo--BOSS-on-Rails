# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def smart_truncate(str)
    str.gsub(/(https?:\/\/[^\/]+).*\/([^\/]+)/, '\1/...\2')
  end
  
end
