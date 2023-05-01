class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.string :number, null: false, unique: true
      t.decimal :amount, precision: 10, scale: 2
      t.integer :status, default: 1
      t.date :due_date
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
    
    add_column :invoices, :status, :integer, default: 1
    execute <<-SQL
      ALTER TABLE invoices
      ADD CONSTRAINT valid_status
      CHECK (status IN (0, 1, 2, 3, 4))
    SQL
  end
end