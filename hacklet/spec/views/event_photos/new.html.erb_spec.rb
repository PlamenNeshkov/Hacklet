require 'rails_helper'

RSpec.describe "event_photos/new", type: :view do
  before(:each) do
    assign(:event_photo, EventPhoto.new(
      :event_id => 1,
      :photo => "MyString"
    ))
  end

  it "renders new event_photo form" do
    render

    assert_select "form[action=?][method=?]", event_photos_path, "post" do

      assert_select "input#event_photo_event_id[name=?]", "event_photo[event_id]"

      assert_select "input#event_photo_photo[name=?]", "event_photo[photo]"
    end
  end
end
