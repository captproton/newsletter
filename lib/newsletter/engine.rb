require 'acts_as_list'

module Newsletter
  class Engine < ::Rails::Engine
    isolate_namespace Newsletter

    config.generators do |g|
      g.test_framework :rspec, fixtures: false
      g.fixture_replacement :factory_bot, dir: 'spec/factories'
      g.assets false
      g.helper false
    end

    # an easy way to get the root of the gem's directory structure
    PLUGIN_ROOT = File.expand_path(File.join(File.dirname(__FILE__),'..','..'))
    # an easy way to get the root of the gem's assets
    def self.assets_path
      File.join(PLUGIN_ROOT,'assets')
    end

  end
end
