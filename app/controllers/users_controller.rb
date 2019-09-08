# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @user = User.includes(:ads).find(params[:id])
  end
end
