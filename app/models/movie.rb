class Movie < ApplicationRecord
  has_many :shows, dependent: :destroy

  validates :title, :genre, :duration, :language, :rating, :release_date, presence: true
end
