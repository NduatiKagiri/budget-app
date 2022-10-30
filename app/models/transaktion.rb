class Transaktion < ApplicationRecord
  belongs_to :category

  validates :name, presence: true
  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
