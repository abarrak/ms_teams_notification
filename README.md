# MS Teams Notifier

A ruby library from simple notification capablities for Microsoft Teams.

> Extracted from [volume sweeper](https://github.com/abarrak/volume_sweeper/blob/main/lib/volume_sweeper) tool.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add ms_teams_notifier
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install ms_teams_notifier
```

## Usage

You can build your notifer per configuration:

```ruby
opts = { ms_teams_webhook:, notification_subject: "" }
notifier = MsTeamsNotifier.new **options
```

Optionally you can formlate a rich message with formatter:

```ruby
text = "Notification for service maintenance"
text_opts = { time: Time.now, call_at: "9304-1343"}

message = MsTeamsNotifier::Formatter.formlate_meessage text, text_opts
```

Then, fire it:

```ruby
notifier.send_ms_teams_notice message
```

## API Docs

The gem specs can [be found at RubyDocs.](https://www.rubydoc.info/gems/expiry_calculator)

## Contributing

Bug reports and pull requests are welcome [on GitHub](https://github.com/abarrak/expiry_calculator).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
