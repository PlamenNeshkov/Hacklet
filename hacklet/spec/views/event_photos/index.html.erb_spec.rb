require 'rails_helper'

RSpec.describe "event_photos/index", type: :view do
  before(:each) do
    assign(:event_photos, [
      EventPhoto.create!(
        :event_id => 1,
        :photo => "Photo"
      ),
      EventPhoto.create!(
        :event_id => 1,
        :photo => "Photo"
      )
    ])
  end

  it "renders a list of event_photos" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Photo".to_s, :count => 2
  end
end
