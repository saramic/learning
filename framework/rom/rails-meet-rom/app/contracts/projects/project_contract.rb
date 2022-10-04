module Projects
  class ProjectContract < Dry::Validation::Contract
    params do
      required(:name).filled(:string)
    end
  end
end