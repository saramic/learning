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
    register("container", ROM.container(config))
  end
end