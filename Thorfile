require 'thor/group'
##
# Module Middleman
##
module Middleman
  class Generator < ::Thor::Group
    include ::Thor::Actions
    ##
    # Source@Root
    ##
    source_root File.expand_path(File.dirname(__FILE__))
    ##
    # Copy_Default_Files
    ##
    def copy_default_files
      directory 'template', '.', exclude_pattern: /\.DS_Store$/
    end
  end
end 
