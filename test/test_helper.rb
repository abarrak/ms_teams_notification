# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)

require "json"
require "webmock/minitest"
require "minitest/autorun"
require "minitest/pride"
require "support/std_helper"

require "simplecov"
SimpleCov.start

require "ms_teams_notification"
