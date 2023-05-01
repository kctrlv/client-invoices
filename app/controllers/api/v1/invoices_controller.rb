class Api::V1::InvoicesController < ActionController::API
  before_action :set_invoice, only: [:show, :update]

  def show
    render json: @invoice
  end

  def create
    @client = Client.find(params[:client_id])
    @invoice = @client.invoices.build(invoice_params)
    @invoice.status = "created"

    if @invoice.save
      render json: @invoice, status: :created
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  def update
    @client = Client.find(params[:client_id])
    @invoice = @client.invoices.find(params[:id])
    
    if @invoice.status == 'closed'
      render json: { error: 'Invoice is already closed.' }, status: :unprocessable_entity
    elsif @invoice.update(invoice_params)
      render json: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  private

  def set_invoice
    @client = Client.find(params[:client_id])
    @invoice = @client.invoices.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:number, :amount, :due_date, :status)
  end
end
