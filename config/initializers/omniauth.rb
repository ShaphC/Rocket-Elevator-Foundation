require 'rspotify/oauth'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, "867a1b097a0949849f0fb02fb0b569db", "d870a514eb5643baaed46f373b45565d", scope: 'user-read-email playlist-modify-public user-library-read user-library-modify'
end