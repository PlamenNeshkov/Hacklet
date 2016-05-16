require 'rails_helper'

RSpec.describe "event_photos/edit", type: :view do
  before(:each) do
    @event_photo = assign(:event_photo, EventPhoto.create!(
      :event_id => 1,
      :photo => "MyString"
    ))
  end

  it "renders the edit event_photo form" do
    render

    assert_select "form[action=?][method=?]", event_photo_path(@event_photo), "post" do

      assert_select "input#event_photo_event_id[name=?]", "event_photo[event_id]"

      assert_select "input#event_photo_photo[name=?]", "event_photo[photo]"
    end
  end
end
