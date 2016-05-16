require 'rails_helper'

RSpec.describe "EventPhotos", type: :request do
  describe "GET /event_photos" do
    it "works! (now write some real specs)" do
      get event_photos_path
      expect(response).to have_http_status(200)
    end
  end
end
