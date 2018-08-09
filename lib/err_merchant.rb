require 'active_support/core_ext/module/attribute_accessors'

module ErrMerchant
  mattr_accessor :layout
  @@layout = 'application'

  mattr_accessor :skip_filters
  @@skip_filters = { before: [], after: [], around: [] }
end

require 'err_merchant/engine'
