module SolidusCustomization
  class Environment

    attr_accessor :source_configurations, :preferences

    def initialize
      @preferences = Spree::Customizations::AppConfiguration.new
    end
  end
end
