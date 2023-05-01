require 'rails_helper'

RSpec.describe "Api::V1::Invoices", type: :request do
  describe "POST /api/v1/clients/1/invoices" do
    let(:valid_attributes) {
      { 
        number: "INV100X",
        amount: 420.99,
        due_date: Date.tomorrow,
      }
    }
    
    let(:invalid_attributes) {
      { 
        number: nil,
        amount: 420.99,
        due_date: Date.tomorrow,
      }
    }
  
    it "creates a new invoice with valid attributes" do
      client = Client.create(name: "Bob")
      expect {
        post "/api/v1/clients/1/invoices", params: { invoice: valid_attributes }
      }.to change(Invoice, :count).by(1)
      puts response
      expect(response).to have_http_status(:created)
    end

    it "does not create a new invoice with a missing number" do
      client = Client.create(name: "Bob")
      expect {
        post '/api/v1/clients/1/invoices', params: { invoice: invalid_attributes}
      }.to_not change(Invoice, :count)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end