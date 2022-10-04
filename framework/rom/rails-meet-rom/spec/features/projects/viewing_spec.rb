require "rails_helper"

RSpec.feature "Users can view projects" do
  let(:project_repo) { ProjectRepository.new(ROM.env) }
  let!(:project) { project_repo.create(name: "Visual Studio Code") }

  scenario "with the project details" do
    visit "/"
    click_link "Visual Studio Code"
    expect(page.current_url).to eq projects_project_url(project)
    within("h2") do
      expect(page).to have_content("Visual Studio Code")
    end
  end
end
