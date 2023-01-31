# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
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
    @bob.follow(@alice)
    assert @bob.following?(@alice)
  end

  test '他ユーザをフォロー解除する__unfollow' do
    @alice.unfollow(@bob)
    assert_not @alice.following?(@bob)
  end

  test 'あるユーザをフォローしている状態か確認__following?' do
    assert @alice.following?(@bob)
  end

  test 'あるユーザにフォローされている状態か確認__followed_by?' do
    assert @bob.followed_by?(@alice)
  end
end
