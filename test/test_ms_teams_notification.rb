# frozen_string_literal: true

require "test_helper"

class TestMsTeamsNotification < Minitest::Test
  include Support::StdHelper

  def test_that_it_has_a_version_number
    refute_nil ::MsTeamsNotification::VERSION
  end

  def test_that_it_sets_configurations_per_the_passed_options
    assert_equal @notifier.instance_variable_get("@ms_teams_webhook"), @data[:ms_teams_webhook]
    assert_equal @notifier.instance_variable_get("@notification_subject"), @data[:notification_subject]
  end

  def test_that_it_sends_ms_teams_notifications_given_a_text_content
    skip("till mocking or catch net errors.")
    assert_match @notifier.send_ms_teams_notice(sample_message), %r{\"title\": \"#{@data[:notification_subject]}}
  end

  private

  def setup
    assign_test_std_channels
    set_sample_data
  end

  def teardown
    unassign_test_std_channels
    unset_sample_data
  end

  def set_sample_data
    @data = {
      ms_teams_webhook: "https://httpbin.org/post",
      notification_subject: "Notification: System Update Scheduled",
    }
    @notifier = MsTeamsNotification::Base.new(**@data)
  end

  def unset_sample_data
    @notifier = nil
  end
end
