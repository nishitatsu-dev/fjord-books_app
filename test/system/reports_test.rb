# frozen_string_literal: true

require 'application_system_test_case'

class ReportsTest < ApplicationSystemTestCase
  setup do
    visit root_url
    fill_in 'Eメール', with: 'bob@example.com'
    fill_in 'パスワード', with: 'password'
    click_button 'ログイン'
  end

  test '日報一覧の表示確認__各テスト共通' do
    visit reports_url
    assert_selector 'h1', text: '日報'
    assert_text 'wonder'
    assert_text 'alice@example.com'
    assert_text 'スポンジ'
    assert_text 'bob'
  end

  test '日報の新規作成' do
    visit reports_url
    click_on '新規作成'
    assert_selector 'h1', text: '日報の新規作成'
    fill_in 'タイトル', with: 'あああ！'
    fill_in '内容', with: 'あああああー'
    click_button '登録する'
    assert_text '日報が作成されました。'
    assert_text 'あああ！'
    assert_text 'あああああー'
  end

  test '日報の編集' do
    visit reports_url
    click_on '編集', match: :prefer_exact
    assert_selector 'h1', text: '日報の編集'
    fill_in 'タイトル', with: 'おおお！'
    fill_in '内容', with: 'おおおおおー'
    click_button '更新する'
    assert_text '日報が更新されました。'
    assert_text 'おおお！'
    assert_text 'おおおおおー'
  end

  test '日報の削除' do
    visit reports_url
    page.accept_confirm do
      click_on '削除'
    end
    assert_text '日報が削除されました。'
    assert_no_text 'スポンジ'
  end
end
