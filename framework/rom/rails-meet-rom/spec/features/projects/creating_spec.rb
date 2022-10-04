require "rails_helper"

RSpec.feature "Users can create new projects", :js do
  scenario "with valid attributes" do
    visit "/"

    click_link "New Project"

    fill_in "Name", with: "Visual Studio Code"
    click_button "Create Project"

    expect(page).to have_content "Project has been created."
  end
end