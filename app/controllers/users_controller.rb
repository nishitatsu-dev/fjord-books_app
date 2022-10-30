# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @followings_count = @user.followings.size
    @followers_count = @user.followers.size
  end

  def follows
    @title = t('views.common.following')
    user = User.find(params[:id])
    @users = user.followings.with_attached_avatar.order(:id).page(params[:page])
    render 'follow_list'
  end

  def followers
    @title = t('views.common.follower')
    user = User.find(params[:id])
    @users = user.followers.with_attached_avatar.order(:id).page(params[:page])
    render 'follow_list'
  end
end
