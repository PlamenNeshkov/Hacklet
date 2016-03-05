require 'rails_helper'

RSpec.describe "events/index", type: :view do
  before(:each) do
    assign(:events, [
      Event.create!(
        :title => "HackTUES",
        :description => "foo",
        :image => "hacktues.png",
        :start => DateTime.new(2015, 6, 27, 18, 00, 00),
        :end => DateTime.new(2015, 6, 29, 15, 00, 00),
        :max_participants => 80
      ),
      Event.create!(
        :title => "HackTUES2",
        :description => "bar",
        :image => "hacktues2.png",
        :start => DateTime.new(2015, 10, 13, 18, 00, 00),
        :end => DateTime.new(2015, 10, 15, 15, 00, 00),
        :max_participants => 100
      )
    ])
  end

  it "renders a list of events" do
    render
    assert_select "tr", 3
    assert_select "tr:nth-child(1) td:first-child", "HackTUES"
    assert_select "tr:nth-child(2) td:first-child", "HackTUES2"
  end
end
