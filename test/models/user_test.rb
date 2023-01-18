# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @me = User.create!(email: 'me@example.com', password: 'password')
    @she = User.create!(email: 'she@example.com', password: 'password')
    @alice = users(:alice)
    @bob = users(:bob)
  end

  test '名前またはemailを返す__name_or_email' do
    user = User.new(email: 'foo@example.com', name: '')
    assert_equal('foo@example.com', user.name_or_email)

    user.name = 'Foo Bar'
    assert_equal('Foo Bar', user.name_or_email)
  end

  test '他ユーザをフォローする__follow' do
    assert_not @me.following?(@she)
    @me.follow(@she)
    assert @me.following?(@she)
  end

  test '他ユーザをフォロー解除する__unfollow' do
    @me.follow(@she)
    assert @me.following?(@she)
    @me.unfollow(@she)
    assert_not @me.following?(@she)
  end

  test 'あるユーザをフォローしている状態か確認__following?' do
    assert @alice.following?(@bob)
  end

  test 'あるユーザにフォローされている状態か確認__followed_by?' do
    assert @bob.followed_by?(@alice)
  end
end
