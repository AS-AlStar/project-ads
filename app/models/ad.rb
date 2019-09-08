class Ad < ApplicationRecord
  extend Enumerize

  enumerize :state, in: %i[draft new rejected approved published archived], default: :draft

  belongs_to :user

  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true
end
