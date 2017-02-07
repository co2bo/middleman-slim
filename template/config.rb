require 'uglifier'
require 'sassc'
#«------------------------------------------
#  Layout-specific Configuration
#«------------------------------------------

#» i18n
activate :i18n, mount_at_root: :de

#» Relative URLs
config[:relative_links] = true

#» Default Layout
config[:layout] = 'application/application'

#» With no Layout
page '/*.xml',    layout: false
page '/*.json',   layout: false
page '/*.txt',    layout: false
page '/404.html', layout: false

#«------------------------------------------
#  Sprockets-specific Configuration
#«------------------------------------------

#» Sprockets
activate :sprockets do |c|
  c.expose_middleman_helpers = true
end

#» Rails-Assets
if defined? RailsAssets
  RailsAssets.load_paths.each do |path|
    sprockets.append_path path
  end
end

# Sass
config[:sass] = { debug_info: false, sourcemap: :inline, line_comments: false, style: :compressed }

#«------------------------------------------
#  Helpers
#«------------------------------------------

helpers do
  # If you need helpers for use in this file, then you
  # can define them here. Otherwise, they should be defined
  # in `helpers/custom_helpers.rb`.
end

#«------------------------------------------
#  Development-specific Configuration
#«------------------------------------------

configure :development do
  #» Host
  config[:host] = "http://localhost:5777"
  #» Relative Links
  config[:relative_links] = true
  #» Asset Pipeline Sets
  confi[:css_dir]    = 'assets/stylesheets'
  confi[:js_dir]     = 'assets/javascripts'
  confi[:images_dir] = 'assets/images'
  confi[:fonts_dir]  = 'assets/fonts-folder'
  #» Image Helper
  activate :automatic_image_sizes
  #» Pretty URLs
  activate :directory_indexes
  page '/404.html', directory_index: false
  #» Autoprefixer
  activate :autoprefixer do |config|
    config.browsers = ['last 2 versions', '> 10%']
    config.cascade  = false
    config.inline   = true
  end
  #» Livereload
  activate :livereload do |reload|
    reload.no_swf = true
  end
end

#«------------------------------------------
#  Production-specific Configuration
#«------------------------------------------

configure :production do
  #» Asset Pipeline Sets
  confi[:css_dir]    = 'assets/stylesheets'
  confi[:js_dir]     = 'assets/javascripts'
  confi[:images_dir] = 'assets/images'
  confi[:fonts_dir]  = 'assets/fonts-folder'
  #» Image Helperv
  activate :automatic_image_sizes
  #» Pretty URLs
  activate :directory_indexes
  page '/404.html', directory_index: false
  #» Autoprefixer
  activate :autoprefixer do |config|
    config.browsers = ['last 2 versions', '> 10%']
    config.cascade  = false
    config.inline   = true
  end
  #» BuildCleaner
  require_relative './lib/build_cleaner'
  activate :build_cleaner
  #» FixPermissions
  require_relative './lib/fix_permissions'
end

#«------------------------------------------
#  Build-specific Configuration
#«------------------------------------------

configure :build do
  #» Host
  config[:host] = "https://co2bo.github.io"
  #» Asset_Hash
  activate :asset_hash
  #» Minify CSS on Build
  activate :minify_css, inline: true
  #» Minify HTML on Build
  activate :minify_html
  #» Minify Javascript on Build
  activate :minify_javascript, inline: true
  #» Relative Urls
  activate :relative_assets
  config[:relative_links] = true
end

#«------------------------------------------
#  Deploy-specific Configuration
#«------------------------------------------

activate :deploy do |deploy|
  deploy.build_before  = true
  deploy.deploy_method = :git
  deploy.branch        = 'master'
end
