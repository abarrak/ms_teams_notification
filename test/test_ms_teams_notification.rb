# frozen_string_literal: true

require "test_helper"

class TestMsTeamsNotification < Minitest::Test
  include Support::StdHelper

  def test_that_it_has_a_version_number
    refute_nil ::MsTeamsNotification::VERSION
  end

  def test_that_it_sets_configurations_per_the_passed_options
    assert_equal @notifier.instance_variable_get("@ms_teams_webhook"), @opts[:ms_teams_webhook]
    assert_equal @notifier.instance_variable_get("@notification_subject"), @opts[:notification_subject]
  end

  def test_that_it_sends_ms_teams_notifications_given_a_text_content
    assert_match %r["title":"#{@opts[:notification_subject]}"], @notifier.send_ms_teams_notice(@message)
    assert_match %r["text":"#{@message}"], @notifier.send_ms_teams_notice(@message)
  end

  private

  def setup
    assign_test_std_channels
    set_sample_data
    stub_webhook_call
  end

  def teardown
    unassign_test_std_channels
    unset_sample_data
  end

  def set_sample_data
    @opts = {
      ms_teams_webhook: "https://httpbin.org/post",
      notification_subject: "Notification: System Update Scheduled",
    }
    @message  = "Hi from Rake test"
    @notifier = ::MsTeamsNotification::Base.new(**@opts)
  end

  def unset_sample_data
    @notifier = nil
  end

  def stub_webhook_call
    body = JSON.dump({ title: @opts[:notification_subject], text: @message })
    stub_request(:post, @opts[:ms_teams_webhook])
      .with(
        body: body,
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Content-Type'=>'application/json',
          'User-Agent'=>'Ruby'
        })
      .to_return(status: 200, body: body, headers: {})
  end
end
