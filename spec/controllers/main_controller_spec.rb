require 'spec_helper'

RSpec.describe MyApp do
  describe "GET#/" do
    it "should load the page" do
      get '/'

      expect(last_response.status).to eq(200)
    end
  end
end
