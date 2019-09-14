# frozen_string_literal: true

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show]

  def show
    @ads = @category.ads.published.page params[:page]
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end
end
