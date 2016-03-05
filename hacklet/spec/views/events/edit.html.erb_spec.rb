require 'rails_helper'

RSpec.describe "events/edit", type: :view do
  before(:each) do
    @event = assign(:event, Event.create!(
        :title => "HackTUES",
        :description => "foo",
        :image => "hacktues.png",
        :start => DateTime.new(2015, 6, 27, 18, 00, 00),
        :end => DateTime.new(2015, 6, 29, 15, 00, 00),
        :max_participants => 80
      ))
  end

  it "renders the edit event form" do
    render
    assert_select "form[action=?][method=?]", event_path(@event), "post" do
      assert_select "input#event_title[name=?]", "event[title]"
      assert_select "textarea#event_description[name=?]", "event[description]"
      assert_select "input#event_image[name=?]", "event[image]"
      assert_select "input#event_max_participants[name=?]", "event[max_participants]"
    end
  end
end
