class UserCountry < ApplicationRecord
  belongs_to :user
  belongs_to :country

  scope :search, -> (country, user) { where("country_id = ? AND user_id = ?", country, user) }
end
