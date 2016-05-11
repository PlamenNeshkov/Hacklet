require 'rails_helper'

RSpec.describe "projects/new", type: :view do
  before(:each) do
    assign(:project, Project.new(
      :name => "MyString",
      :description => "MyString",
      :repository_url => "MyString",
      :team => nil
    ))
  end

  it "renders new project form" do
    render

    assert_select "form[action=?][method=?]", projects_path, "post" do

      assert_select "input#project_name[name=?]", "project[name]"

      assert_select "input#project_description[name=?]", "project[description]"

      assert_select "input#project_repository_url[name=?]", "project[repository_url]"

      assert_select "input#project_team_id[name=?]", "project[team_id]"
    end
  end
end
