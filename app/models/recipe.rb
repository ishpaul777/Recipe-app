class Recipe < ApplicationRecord
  has_many :recipe_foods, dependent: :destroy
  belongs_to :user

  validates :name, presence: true, length: { maximum: 50, minimum: 3 }
  validates :description, presence: true, length: { minimum: 5 }
  validates :preparation_time, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :cooking_time, presence: true, numericality: { greater_than_or_equal_to: 0 }

end
