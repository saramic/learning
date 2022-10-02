Projects::Application.register_provider(:database) do
  prepare do
    require "rom"
    require "rom-sql"
    connection = Sequel.connect(ENV["DATABASE_URL"], extensions: %i[pg_timestamptz])
    register("database:connection", connection)
    register(:database, ROM::Configuration.new(:sql, connection))
  end

  start do
    config = container[:database]
    # cannot rake db:migrate with following line
    config.auto_registration(Projects::Application.config.root + "lib/projects")
    register("container", ROM.container(config))
  end
end