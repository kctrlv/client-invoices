class Invoice < ApplicationRecord
  belongs_to :client
  enum status: [:rejected, :created, :approved, :purchased, :closed]
  validates :number, presence: true, uniqueness: true
  validates :amount, presence: true
  validates :status, presence: true
  validates :due_date, presence: true
end
