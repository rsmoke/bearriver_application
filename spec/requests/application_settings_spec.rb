require 'rails_helper'

RSpec.describe "ApplicationSettings", type: :request do
  describe "GET /application_settings" do
    it "works! (now write some real specs)" do
      get application_settings_path
      expect(response).to have_http_status(200)
    end
  end
end
