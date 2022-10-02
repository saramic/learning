require_relative "../../config/boot"

require "dry/system/container"
require "dry/system/loader/autoloading"

module Projects
  class Application < Dry::System::Container
    configure do |config|
      config.root = File.expand_path("../..", __dir__)
      config.component_dirs.add "lib" do |dir|
        dir.namespaces.add "projects", key: nil
      end
    end
  end
end
