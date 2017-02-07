# *************************************************
#
#  CustomHelpers
#
# *************************************************
module CustomHelpers
  ##
  # Components
  ##
  def component(path, locals={})
    partial "components/#{path}", locals
  end
  ##
  # Active Links
  ##
  def is_active(page)
    current_page.url == page ? 'active' : ''
  end
  ##
  # Page Verify
  ##
  def page_verify
    data.site.page_verify
  end
  ##
  # Page LG
  ##
  def page_lg
    data.site.lg
  end
  ##
  # Twitter Handle
  ##
  def twitter_handle
    data.site.twitter_handle
  end
  ##
  # OG Type
  ##
  def og_type
    data.site.og_type
  end
  ##
  # Gplus
  ##
  def g_plus
    data.site.g_plus
  end
  ##
  # URL
  ##
  def urlize(str)
    str.downcase.gsub(' ', '-')
  end
end
