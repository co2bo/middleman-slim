module PageHelpers
  ##
  # PAGE_TITLE
  ##
  def page_title
    current_page.data.title || data.site.title
  end
  ##
  # PAGE_DESCRIPTION
  ##
  def page_description
    current_page.data.description || data.site.description
  end
  ##
  # PAGE_KEYWORDS
  ##
  def page_keywords
    current_page.data.keywords || data.site.keywords
  end
  ##
  # CURRENT_PAGE_URL
  ##
  def current_page_url
    "#{data.site.url}#{current_page.url}"
  end
  ##
  # PAGE_URL
  ##
  def page_url page
    "#{data.site.url}#{page.url}"
  end
  ##
  # TWITTER_CARD_TYPE
  ##
  def page_twitter_card_type
    current_page.data.twitter_card_type || 'summary'
  end
  ##
  # PAGE_IMAGE
  ##
  def page_image
    current_page.data.image_path || data.site.logo_image_path
  end
  ##
  # TWITTER
  ##
  def twitter_url
    "https://twitter.com/share?text=“#{page_title}”" +
                               "&url=#{current_page_url}" +
                               "&via=#{data.site.twitter_handle}"
  end
  ##
  # FACEBOOK
  ##
  def facebook_url
    "https://www.facebook.com/dialog/feed?app_id=#{data.site.facebook_app_id}" +
                                          "&caption=#{page_title}" +
                                          "&picture=#{page_image}" +
                                          "&name=“#{page_title}”" +
                                          "&description=#{page_description}" +
                                          "&display=popup" +
                                          "&link=#{current_page_url}" +
                                          "&redirect_uri=#{current_page_url}"
  end
  ##
  # GOOGLE+
  ##
  def google_plus_url
    "https://plus.google.com/share?url=#{current_page_url}"
  end
end
