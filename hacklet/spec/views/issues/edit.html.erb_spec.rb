require 'rails_helper'

RSpec.describe "issues/edit", type: :view do
  before(:each) do
    @issue = assign(:issue, Issue.create!(
      :title => "MyString",
      :description => "MyString",
      :solved => false,
      :event => nil,
      :user => nil
    ))
  end

  it "renders the edit issue form" do
    render

    assert_select "form[action=?][method=?]", issue_path(@issue), "post" do

      assert_select "input#issue_title[name=?]", "issue[title]"

      assert_select "input#issue_description[name=?]", "issue[description]"

      assert_select "input#issue_solved[name=?]", "issue[solved]"

      assert_select "input#issue_event_id[name=?]", "issue[event_id]"

      assert_select "input#issue_user_id[name=?]", "issue[user_id]"
    end
  end
end
