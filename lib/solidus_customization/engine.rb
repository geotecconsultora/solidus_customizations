module SolidusCustomization
  class Engine < Rails::Engine
    require "solidus_core"

    isolate_namespace Spree
    engine_name "solidus_customizations"

    config.generators do |g|
      g.test_framework :rspec
    end

    config.autoload_paths += %W(#{config.root}/lib)

    initializer "spree.customization.environment", before: :load_config_initializers do |app|
      app.config.spree.add_class('customization')
      app.config.spree.customization = SolidusCustomization::Environment.new
      Spree::Customizations::Config = app.config.spree.customization.preferences
    end

    initializer "spree.customization.register.customization.source_configurations" do |app|
      app.config.spree.customization.source_configurations = []
    end


    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), '../spree/**/*_decorator.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      # Match line_items on designs
      Spree::Order.register_line_item_comparison_hook(:customizations_match)
    end

    config.to_prepare &method(:activate).to_proc
  end
end
