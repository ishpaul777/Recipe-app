class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy

  validates :name, presence: true
  validates :units, presence: true

  validates :price, presence: true, numericality: { only_numeric: true, greater_than: 0 }
  validates :units, length: { maximum: 20 }
  validates :name, length: { maximum: 50 }
  validates :quantity, numericality: { only_numeric: true, greater_than: 0 }
end
