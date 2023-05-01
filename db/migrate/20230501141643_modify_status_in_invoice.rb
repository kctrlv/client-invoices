class ModifyStatusInInvoice < ActiveRecord::Migration[7.0]
  def change
    change_column :invoices, :status, :integer, null: false, default: 1
  end
end
