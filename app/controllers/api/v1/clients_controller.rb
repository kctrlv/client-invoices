class Api::V1::ClientsController < ActionController::API
  def index
    @clients = Client.all
    render json: @clients  
  end

  def show
    @client = Client.find_by(id: params[:id])
    if @client
      render json: @client
    else
      render json: { error: 'Client not found' }, status: :not_found
    end
  end

  def create
    @client = Client.new(client_params)
  
    if @client.save
      render json: @client, status: :created
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  def invoices
    @client = Client.find_by(id: params[:id])
    if @client
      render json: @client.invoices
    else
      render json: { error: 'Client not found' }, status: :not_found
    end
  end
  
  private

  def client_params
    params.require(:client).permit(:name)
  end
end
