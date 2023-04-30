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
      expect(response).to have_http_status(:success)

      expect(JSON.parse(response.body)).to be_an(Array)
      expect(JSON.parse(response.body)[0]['name']).to eq("Waldo")
    end
  end

  describe 'GET /api/v1/clients/:id' do
    it 'returns the client when the client exists' do
      Client.create(name: "Waldo")
      get "/api/v1/clients/1"

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)['id']).to eq(1)
      expect(JSON.parse(response.body)['name']).to eq("Waldo")
    end

    it 'returns not found when client does not exist' do
      get '/api/v1/clients/9999'
      expect(response).to have_http_status(:not_found)
    end
  end
end