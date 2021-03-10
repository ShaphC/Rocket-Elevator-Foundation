module SlackNotifier
    env = ENV["slack_token"]
    CLIENT = Slack::Notifier.new env
end