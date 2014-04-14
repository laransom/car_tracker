class Car < ActiveRecord::Base
  validates :color, presence: true, format: /[A-z]/, on: :create
  validates :year, presence: true, numericality: { greater_than: 1979, less_than: 2020 }
  validates :mileage, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 1000000 }

  belongs_to :manufacturer
end
