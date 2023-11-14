require "googleauth"

class RedirectController < ApplicationController
  def index
credentials = Google::Auth::UserRefreshCredentials.new(
  client_id: ENV["CLIENT_ID"],
  client_secret: ENV["CLIENT_SECRET"],
  scope: [
    "https://www.googleapis.com/auth/drive",
    "https://spreadsheets.google.com/feeds/",
  ],
  redirect_uri: "http://localhost:3000/redirect")

auth_url = credentials.authorization_uri
credentials.code = authorization_code
credentials.fetch_access_token!
session = GoogleDrive::Session.from_credentials(credentials)

  end

  def restore
credentials = Google::Auth::UserRefreshCredentials.new(
  client_id: ENV["CLIENT_ID"],
  client_secret: ENV["CLIENT_SECRET"],
  scope: [
    "https://www.googleapis.com/auth/drive",
    "https://spreadsheets.google.com/feeds/",
  ],
  redirect_uri: "http://localhost:3000/redirect",
additional_parameters: { "access_type" => "offline" })
auth_url = credentials.authorization_uri
credentials.refresh_token = refresh_token
credentials.fetch_access_token!
session = GoogleDrive::Session.from_credentials(credentials)

  end
end
