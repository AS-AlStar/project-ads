# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    if params[:q]
      @ads = Ad.search(params[:q]).page params[:page]
      respond_to do |format|
        format.html
      end
    else
      @ads = Ad.published.page params[:page]
    end
  end
end
