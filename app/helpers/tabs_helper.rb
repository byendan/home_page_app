module TabsHelper
  
  # standardizes the beginning of urls
  def url_fix(tab_url)
    prefix = "http"
    if tab_url[0, 4] != prefix
      tab_url = "http://" << tab_url
    end
    return tab_url
  end
  
  

end
