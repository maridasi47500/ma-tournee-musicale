require "googleauth"
 
credentials = Google::Auth::UserRefreshCredentials.new(
  client_id: ENV["CLIENT_ID"],
  client_secret: ENV["CLIENT_SECRET"],
  scope: [
    "https://www.googleapis.com/auth/drive",
    "https://spreadsheets.google.com/feeds/",
  ],
  redirect_uri: "http://localhost:3000/redirect")

auth_url = credentials.authorization_uri

