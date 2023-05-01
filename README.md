# Client Invoices

This is a Rails API project with some basic functionality to create and track invoices for clients

## Installation

To get started with this project, you'll need to have the following software installed on your computer:

- Ruby 3.2.2
- Rails 7.0.4.3

Once those are installed, follow these steps to get up an running

1. Clone this repository to your local machine: `git clone https://github.com/kctrlv/client-invoices.git`
2. Change into the project directory: `cd client-invoices`
3. Install the required gems: `bundle install`
4. Create the database: `rails db:create`
5. Run the database migrations: `rails db:migrate`
6. Start the server: `rails server`

The API should now be running on `http://localhost:3000`.

## Usage

This API has a few important endpoints, 
- GET `/api/v1/clients` will return a list of all the clients, and their nested invoices.
- GET `/api/v1/clients/1` will return a the first client in the system
- POST `/api/v1/clients/1/invoices` will create a new invoice for the given client
- PUT `/api/v1/clients/1/invoices` will update the invoice, example body: `{"invoice": {"status": "approved"}}`