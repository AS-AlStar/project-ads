# frozen_string_literal: true

class Ad < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  index_name Rails.application.class.parent_name.underscore
  document_type name.downcase

  settings index: { number_of_shards: 1 } do
    mapping dynamic: false do
      indexes :title, analyzer: 'english'
      indexes :body, analyzer: 'english'
    end
  end

  paginates_per 15

  mount_uploader :image, ImageUploader

  extend Enumerize

  enumerize :state, in: %i[draft new rejected approved published archived], default: :draft

  belongs_to :user
  belongs_to :category

  validates :title, presence: true, length: { minimum: 2 }
  validates :body, presence: true

  scope :new_state, -> { where(state: :new) }
  scope :published, -> { where(state: :published) }
  scope :archived, -> { where(state: :archived) }

  def old?
    (Time.zone.now - updated_at) > (2.days + 23.hours + 50.minutes)
  end

  def move_to_archived
    update(state: 'archived')
  end

  def move_to_published
    update(state: 'published')
  end

  def from_published_to_archived
    Ad.published.each do |ad|
      ad.move_to_archived if old?
    end
  end

  def from_new_to_published
    Ad.new_state.each(&:move_to_published)
  end
end
