module SolidusCustomizations
  class Engine < Rails::Engine
    engine_name "solidus_customizations"

    config.autoload_paths += %W(#{config.root}/lib)

    initializer 'configure personal wine permitted attributes', after: 'require subscription lib helpers' do
      SolidusCustomizations::PermittedAttributes.update_spree_permitted_attributes
    end

    def self.activate
      ['app', 'lib'].each do |dir|
        Dir.glob(File.join(File.dirname(__FILE__), "../../#{dir}/**/*_decorator*.rb")) do |c|
          Rails.application.config.cache_classes ? require(c) : load(c)
        end
      end

      Spree::Order.register_line_item_comparison_hook(:customizations_match)
    end

    config.to_prepare &method(:activate).to_proc

  end
end