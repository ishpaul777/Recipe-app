class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :name, presence: true

  has_many :foods, dependent: :destroy
  has_many :recipes, dependent: :destroy

  # Every user is default user by default
  Roles = %i[default admin].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end
end
