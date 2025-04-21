# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "ms_teams_notification"
require "support/std_helper"
require "json"
require "webmock/minitest"

require "minitest/autorun"
