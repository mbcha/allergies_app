class Contact < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :phone_number, presence: true
  validates :relationship, presence: true

  belongs_to :user
end
