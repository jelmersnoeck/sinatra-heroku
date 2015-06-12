require File.expand_path '../../spec_helper.rb', __FILE__

RSpec.describe MyApp do
  describe "GET#/" do
    it "should load the page" do
      get '/'

      expect(last_response.status).to eq(200)
    end
  end
end
