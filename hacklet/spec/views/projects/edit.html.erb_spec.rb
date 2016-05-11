require 'rails_helper'

RSpec.describe "projects/edit", type: :view do
  before(:each) do
    @project = assign(:project, Project.create!(
      :name => "MyString",
      :description => "MyString",
      :repository_url => "MyString",
      :team => nil
    ))
  end

  it "renders the edit project form" do
    render

    assert_select "form[action=?][method=?]", project_path(@project), "post" do

      assert_select "input#project_name[name=?]", "project[name]"

      assert_select "input#project_description[name=?]", "project[description]"

      assert_select "input#project_repository_url[name=?]", "project[repository_url]"

      assert_select "input#project_team_id[name=?]", "project[team_id]"
    end
  end
end
