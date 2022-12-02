# frozen_string_literal: true

class FansController < ApplicationController
  def create
    current_user.active_fans.find_or_create_by(follower_id: params[:user_id])
    redirect_to user_path(params[:user_id])
  end

  def destroy
    follow = current_user.active_fans.find_by(follower_id: params[:user_id])
    follow.destroy
    redirect_to user_path(params[:user_id])
  end
end
