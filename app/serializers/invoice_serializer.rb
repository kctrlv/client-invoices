class InvoiceSerializer < ActiveModel::Serializer
  attributes :id, :amount, :status, :due_date, :created_at, :updated_at

  belongs_to :client
end
