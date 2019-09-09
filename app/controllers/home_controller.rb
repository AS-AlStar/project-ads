# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @ads = Ad.where(state: 'published')
  end
end
