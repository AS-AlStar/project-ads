# frozen_string_literal: true

# frozen_string_literal

module AdsHelper
  STATE_CSS_CLASSES = {
    draft: 'badge-secondary',
    new: 'badge-primary',
    approved: 'badge-success',
    rejected: 'badge-danger',
    published: 'badge-warning',
    archived: 'badge-dark'
  }.with_indifferent_access.freeze

  def badge_by_state(advert)
    content_tag(:span, advert.state.upcase, class: "badge #{STATE_CSS_CLASSES.fetch(advert.state)}")
  end
end
