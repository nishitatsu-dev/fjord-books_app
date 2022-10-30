# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  has_many :active_fans, class_name: 'Fan', foreign_key: :following_id, inverse_of: :following, dependent: :destroy
  has_many :passive_fans, class_name: 'Fan', foreign_key: :follower_id, inverse_of: :follower, dependent: :destroy
  has_many :followings, through: :active_fans, source: :follower
  has_many :followers, through: :passive_fans, source: :following

  def followed_by?(user)
    passive_fans.find_by(following_id: user.id).present?
  end
end
