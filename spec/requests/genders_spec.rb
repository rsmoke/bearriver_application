require 'rails_helper'

RSpec.describe "Genders", type: :request do
  describe "GET /genders" do
    it "works! (now write some real specs)" do
      get genders_path
      expect(response).to have_http_status(200)
    end
  end
end
