class Group < ApplicationRecord
  has_many :spots, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :creator, presence: true
  validates :text, presence: true
end
