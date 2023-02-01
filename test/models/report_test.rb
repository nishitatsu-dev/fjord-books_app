# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @alice_report = reports(:alice)
  end

  test 'レポート作者と同ユーザか確認__editable?' do
    alice = users(:alice)
    assert @alice_report.editable?(alice)
  end

  test 'レポートの作成日時から日付だけを返す__created_on' do
    assert_equal(Date.current, @alice_report.created_on)
  end
end
