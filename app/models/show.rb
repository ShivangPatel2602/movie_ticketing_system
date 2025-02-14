class Show < ApplicationRecord
  belongs_to :movie
  has_many :tickets, dependent: :destroy

  validates :date, :time, :available_seats, :ticket_price, presence: true
  validates :available_seats, numericality: { greater_than_or_equal_to: 0 }
  validates :ticket_price, numericality: { greater_than: 0 }
end
