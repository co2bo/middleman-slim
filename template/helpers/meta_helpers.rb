# *************************************************
#
#  MetaHelpers
#
# *************************************************
module MetaHelpers
  ##
  # Meta Title
  ##
  def meta_title
    ERB.new(current_page.data[:meta_title]).result(binding)
  rescue
    data.site.title
  end
  ##
  # Meta Name
  ##
  def meta_name
    ERB.new(current_page.data[:meta_name]).result(binding)
  rescue
    data.site.name
  end
  ##
  # Meta Keywords
  ##
  def meta_keywords
    ERB.new(current_page.data[:meta_keywords]).result(binding)
  rescue
    data.site.keywords
  end
  ##
  # Meta Description
  ##
  def meta_description
    ERB.new(current_page.data[:meta_description]).result(binding)
  rescue
    data.site.description
  end
  ##
  # Meta URL
  ##
  def meta_url page
    ERB.new(current_page.data[:meta_url]).result(binding)
  rescue
    "#{data.site.url}#{page.url}"
  end
  ##
  # Meta URL
  ##
  def meta_current_url
    ERB.new(current_page.data[:meta_current_url]).result(binding)
  rescue
    "#{data.site.url}#{current_page.url}"
  end
  ##
  # Meta Image
  ##
  def meta_image
    ERB.new(current_page.data[:meta_image]).result(binding)
  rescue
    data.site.og_image_path
  end
  ##
  # Meta Iconpath
  ##
  def meta_iconpath
    ERB.new(current_page.data[:meta_iconpath]).result(binding)
  rescue
    data.site.iconpath
  end
  ##
  # Meta_Twitter_Card_Type
  ##
  def meta_twitter_card_type
    ERB.new(current_page.data[:meta_twitter_card_type]).result(binding)
  rescue
    data.site.twitter_summery
  end
  ##
  # Page Title
  ##
  def page_title(separator = '-')
    if current_page.data.title
      "#{ current_page.data.title } #{ separator } #{ data.site.title }"
    else
      data.site.title
    end
  end
  ##
  # Full Title
  ##
  def full_title(page_title=nil)
    page_title ||= ""
    base_title = "co2bo.github.io - A Middleman Test App"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
