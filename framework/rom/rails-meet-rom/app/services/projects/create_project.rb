class Projects::CreateProject
  def self.call(params)
    @validation = Projects::ProjectContract.new.call(params)
    if @validation.success?
      repo = ProjectRepository.new(ROM.env)
      project = repo.create(params)
      send_emails(project)
      [true, {project: project}]
    else
      @project = Projects::Project.new(params)
      [false, {project: project, errors: @validation.errors}]
    end
  end

  def self.send_emails(project)
    # code to send emails goes here
  end
end