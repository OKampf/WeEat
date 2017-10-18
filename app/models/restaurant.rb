# == Schema Information
#
# Table name: restaurants
#
#  id                :integer          not null, primary key
#  name              :string
#  rating            :decimal(8, 2)
#  accept_10bis      :boolean
#  address           :string
#  max_delivery_time :integer
#  cuisine_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Restaurant < ApplicationRecord
  belongs_to :cuisine
  has_many :reviews, dependent: :destroy

  validates :name, :address, :max_delivery_time, presence: true
  validates :max_delivery_time, numericality: { greater_than_or_equal_to: 1 }

  default_scope { includes(:reviews, :cuisine) }
end
