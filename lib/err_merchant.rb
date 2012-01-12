require 'active_support/core_ext/module/attribute_accessors'

module ErrMerchant
  mattr_accessor :layout
  @@layout = 'application'
end

require 'err_merchant/engine'