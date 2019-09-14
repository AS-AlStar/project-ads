# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @ads = Ad.published.page params[:page]
  end
end
