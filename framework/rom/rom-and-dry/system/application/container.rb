require_relative "../../config/boot"

require "dry/system/container"
require "dry/system/loader/autoloading"
require "dry/auto_inject"

module Projects
  class Application < Dry::System::Container
    configure do |config|
      config.root = File.expand_path("../..", __dir__)
      config.component_dirs.add "lib" do |dir|
        dir.namespaces.add "projects", key: nil
      end
    end
  end

  Import = Dry::AutoInject(Application)
end

require "zeitwerk"
loader = Zeitwerk::Loader.new
loader.push_dir Projects::Application.config.root.join("lib").realpath
loader.setup