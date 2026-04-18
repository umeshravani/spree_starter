Rails.application.config.to_prepare do
  if defined?(Spree::PermittedAttributes)
    module Spree
      module PermittedAttributes
        def self.permitted_product_properties_attributes
          [:id, :property_name, :value, :position, :show_property, :_destroy]
        end
      end
    end
  end
end