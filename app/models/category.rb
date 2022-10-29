class Category < ApplicationRecord
  belongs_to :user
  has_many :transaktions

  validates :name, presence: true
  validates :icon, presence: true
end
