class Api::V1::InvoicesController < ActionController::API
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

  private

  def invoice_params
    params.require(:invoice).permit(:number, :amount, :due_date)
  end
end
