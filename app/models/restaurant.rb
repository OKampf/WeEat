class Restaurant < ApplicationRecord
  belongs_to :cuisine
  has_many :reviews, dependent: :destroy
  validates :name, :address, :max_delivery_time, presence: true
  validates :max_delivery_time, numericality: { greater_than_or_equal_to: 1 }
end
