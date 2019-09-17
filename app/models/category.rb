# frozen_string_literal: true

class Category < ApplicationRecord
  extend Enumerize

  has_many :ads, dependent: :destroy

  validates :name, presence: true

  enumerize :status, in: [true, false], default: 'false'

  scope :published, -> { where(status: true) }
end
