class Project < ApplicationRecord
  extend FriendlyId

  has_many_attached :images
  has_one_attached :avatar
  friendly_id :name, use: :slugged

  validates :name, presence: true
  validates :body, presence: true
end
