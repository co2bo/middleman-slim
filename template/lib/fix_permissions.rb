# ************************************************
#
#  Fix Permissions
#
# ************************************************
class FixPermissions < Middleman::Extension
  def initialize(app, options_hash={}, &block)
    super
    app.after_build do |builder|
      builder.thor.run 'chmod -R a+r build'
    end
  end
end
::Middleman::Extensions.register(:fix_permissions, FixPermissions)
