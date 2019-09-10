# frozen_string_literal: true

class Ad < ApplicationRecord
  paginates_per 15

  mount_uploader :image, ImageUploader

  extend Enumerize

  enumerize :state, in: %i[draft new rejected approved published archived], default: :draft

  belongs_to :user

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true
end
