require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleBuilding
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.autoload_paths += Dir[Rails.root.join('app', 'parameters', '**', '*')]
    config.secret_key = '0e426eb2172ad5079619d0d0dcfea8362b83be53e19a0c96dc34f3a4abf401b7364dec0483780cbfe41d340865459cd7ba1ff4709d43df4f4e6cffc58be4920e'
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
