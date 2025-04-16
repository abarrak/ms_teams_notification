# frozen_string_literal: true

require_relative "ms_teams_notifier/version"
require_relative "ms_teams_notifier/notification"
require_relative "ms_teams_notifier/notification_formatter"

module MsTeamsNotifier
  include Notification
end
