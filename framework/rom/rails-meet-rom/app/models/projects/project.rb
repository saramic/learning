require "types"

module Projects
  class Project < ApplicationModel
    attribute :id, Types::Integer
    attribute :name, Types::String
  end
end
