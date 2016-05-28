require 'spec_helper'

describe IMHR::API do
  subject(:api) { described_class }

  describe("/v1/events#create") {
    before {
      stub_request(:post, "https://imhr.io/api/v1/events").
        with(body: expected_body).
        to_return(
          status: 201,
          body: { created: true }.to_json,
          headers: { "Content-Type" => "application/json" }
        )
    }

    let(:path) { "/v1/events" }
    let(:expected_body) {
      {
        "type" => "Events::ForgotClockOut",
        "data" => {
          "clock_in_time" => "2016-05-28T14:50:38Z",
          "phone_number" => "+16049661020"
        }
      }
    }

    it("posts to /v1/events") {
      response = api.create "/v1/events",
                            type: "Events::ForgotClockOut",
                            data: {
                              phone_number: "+16049661020",
                              clock_in_time: "2016-05-28T14:50:38Z"
                            }

      expect(response.parsed).to eq("created" => true)
    }
  }
end
