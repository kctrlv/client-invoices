require 'rails_helper'

RSpec.describe "Api::V1::Clients", type: :request do
  describe "POST /api/v1/clients" do
    let(:valid_attributes) {
      { name: "Bob"}
    }
    
    let(:invalid_attributes) {
      { name: nil }
    }
  
    it "it creates a new client with a valid attributes" do
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
end