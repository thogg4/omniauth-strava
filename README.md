# Omniauth-Strava

This is a Omniauth Rubygem for authenticating users with Strava.

## Installation

Add to your Gemfile:

```
gem "omniauth-strava"
```

Run bundle install afterwards.

To ``config/initializers/omniauth.rb`` add:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :strava, 'strava_client_id', 'strava_api_key', scope: 'read', approval_prompt: 'auto'
end
```

``scope`` might be:

    read   (default) read public segments, public routes, public profile data, public posts, public events, club feeds, and leaderboards
    read_all read private routes, private segments, and private events for the user
    profile:read_all  read all profile information even if the user has set their profile visibility to Followers or Only You
    profile:write update the user's weight and Functional Threshold Power (FTP), and access to star or unstar segments on their behalf
    activity:read read the user's activity data for activities that are visible to Everyone and Followers, excluding privacy zone data
    activity:read_all the same access as **activity:read**, plus privacy zone data and access to read the user's activities with visibility set to Only You
    activity:write access to create manual activities and uploads, and access to edit any activities that are visible to the app, based on activity read access level

`approval_prompt` could be `force` or `auto`, use force to always show the authorization prompt even if the user has already authorized the current application, default is auto.

   force or auto, use force to always show the authorization prompt even if the user has already authorized the current application, default is auto.

Please refer to the [Omniauth documentation](https://github.com/intridea/omniauth) on how to use Omniauth.
