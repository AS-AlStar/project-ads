# frozen_string_literal: true

class AdsController < ApplicationController
  before_action :set_ad, only: %i[show edit update destroy]

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(ad_params)
    @ad.user = current_user
    if @ad.save
      redirect_to @ad
    else
      render 'new'
    end
  end

  def show; end

  def edit; end

  def update
    if @ad.update(ad_params)
      redirect_to
    else
      render 'edit'
    end
  end

  def destroy
    @ad.destroy
    redirect_to root_path
  end

  private

  def ad_params
    params.require(:ad).permit(:title, :body, :image, :state, :remove_image)
  end

  def set_ad
    @ad = Ad.find(params[:id])
  end
end
