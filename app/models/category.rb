# frozen_string_literal: true

class Category < ApplicationRecord
  extend Enumerize

  paginates_per 15

  has_many :ads, dependent: :destroy

  validates :name, presence: true

  enumerize :status, in: [true, false], default: 'false'

  scope :published, -> { where(status: true) }
end
