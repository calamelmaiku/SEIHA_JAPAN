class Spot < ApplicationRecord
  belongs_to :group
  has_many :visiteds
  has_many :users, through: :visiteds
end
