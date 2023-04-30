require 'rails_helper'

RSpec.describe "Api::V1::Clients", type: :request do
  describe "POST /api/v1/clients" do
    let(:valid_attributes) {
      { name: "Bob"}
    }
    
    let(:invalid_attributes) {
      { name: nil }
    }
  
    it "creates a new client with a valid attributes" do
      expect {
        post '/api/v1/clients', params: { client: valid_attributes }
      }.to change(Client, :count).by(1)
      expect(response).to have_http_status(:created)
    end

    it "does not create a new client with invalid attributes" do
      expect {
        post '/api/v1/clients', params: { client: invalid_attributes }
      }.to_not change(Client, :count)

      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe "GET /api/v1/clients" do
    it "returns a list of our clients" do
      Client.create(name: "Waldo")
      get '/api/v1/clients'
      expect(response).to have_http_status(200)
      response_body = JSON.parse(response.body)
      expect(response_body).to be_an(Array)
      expect(response_body[0]['name']).to match("Waldo")
    end
  end
end