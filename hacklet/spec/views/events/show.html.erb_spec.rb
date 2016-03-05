require 'rails_helper'

RSpec.describe "events/show", type: :view do
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

  it "renders event properties" do
    render
    expect(rendered).to match(/HackTUES/)
    expect(rendered).to match(/foo/)
    expect(rendered).to match(/80/)
  end
end
