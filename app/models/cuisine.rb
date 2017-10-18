# == Schema Information
#
# Table name: cuisines
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cuisine < ApplicationRecord
  has_many :restaurants, dependent: :destroy
  before_destroy :ensure_not_referenced_by_any_restaurant
  validates :name, presence: true
  validates :name, uniqueness: true

  private

  # ensure that there are no restaurants referencing this cuisine
  def ensure_not_referenced_by_any_restaurant
    unless restaurants.empty?
      errors.add(:base, 'Restaurants present')
      throw :abort
    end
  end

end
