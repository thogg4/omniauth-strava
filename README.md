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
  provider :strava, Rails.application.secrets.strava_client_id, Rails.application.secrets.strava_api_key, scope: 'read'
end
```

``scope`` might be:

    read - Allows access to public segments, public routes, public profile data, public posts, public events, club feeds, and leaderboards. This scope matches the old default scope, except it no longer includes access to activities and certain athlete endpoints mentioned below.
    read_all - Allows access to view private routes, private segments, and private events. This scope matches the old view_private scope, except that it no longer includes access to private activities.
    profile:read_all - NEW! Allows access to read all profile information even if the user has set their profile visibility to “Followers” or “Only You.”
    profile:write - NEW! Allows access to update the user’s weight and Functional Threshold Power (FTP), and access to star or unstar segments on their behalf.
    activity:read - NEW! Allows access to read the user’s activity data for activities that are visible to “Everyone” and “Followers.”
    activity:read_all - NEW! Allows the same access as activity:read, plus access to read the athlete’s activities that are visible to “Only You.”
    activity:write - NEW! Allows access to create manual activities and uploads, and access to edit any activities that are visible to the app (based on activity read access level).

Please refer to the [Omniauth documentation](https://github.com/intridea/omniauth) on how to use Omniauth.
