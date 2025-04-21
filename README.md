# MS Teams Notifications
[![Gem Version](https://badge.fury.io/rb/ms_teams_notification.svg)](https://rubygems.org/gems/ms_teams_notification)
[![Build](https://github.com/abarrak/ms_teams_notification/actions/workflows/main.yml/badge.svg)](https://github.com/abarrak/ms_teams_notification/actions/workflows/main.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


A ruby library from simple notification capablities for Microsoft Teams.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add ms_teams_notification
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install ms_teams_notification
```

## Usage

You can build your notifer passing the webhook url and title:

```ruby
opts = { ms_teams_webhook: "", notification_subject: "" }
notifier = MsTeamsNotification::Base.new **options
```

**Optionally** you can formlate a rich message with formatter.<br>
The formatter accepts a hash of additional fields that will be appended as list after the message.

```ruby
message = MsTeamsNotification::Formatter.formlate_meessage "Message", { time: Time.now }
```

Then, fire it:

```ruby
notifier.send_ms_teams_notice message
```


## API Docs

The gem specs can [be found at RubyDocs.](https://www.rubydoc.info/gems/ms_teams_notification)

## Contributing

Bug reports and pull requests are welcome [on GitHub](https://github.com/abarrak/ms_teams_notification).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
