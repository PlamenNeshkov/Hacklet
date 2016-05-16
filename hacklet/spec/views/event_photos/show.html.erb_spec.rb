require 'rails_helper'

RSpec.describe "event_photos/show", type: :view do
  before(:each) do
    @event_photo = assign(:event_photo, EventPhoto.create!(
      :event_id => 1,
      :photo => "Photo"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Photo/)
  end
end
