class Invoice < ApplicationRecord
  belongs_to :client

  enum status: [:rejected, :created, :approved, :purchased, :closed]

  validates :number, presence: true, uniqueness: true
end
