module Spree
  module Customizations
    class Environment
      include Core::EnvironmentExtension

      add_class_set :source_configurations

      attr_accessor :preferences

      def initialize
        @preferences = Spree::Customizations::AppConfiguration.new
      end
    end
  end
end