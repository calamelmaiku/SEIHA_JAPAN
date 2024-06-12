class Spot < ApplicationRecord
  belongs_to :group
  has_many :visiteds, dependent: :destroy
  has_many :users, through: :visiteds

  validates :name, presence: true
  validates :text, presence: true
  validates :address, presence: true
  validates :latitude, presence: true, numericality: true
  validates :longitude, presence: true, numericality: true
end
