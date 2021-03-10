module SlackNotifier
    CLIENT = Slack::Notifier.new ENV["token"]
end