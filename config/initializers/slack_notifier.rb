module SlackNotifier
    CLIENT = Slack::Notifier.new ENV["slack_token"]
end