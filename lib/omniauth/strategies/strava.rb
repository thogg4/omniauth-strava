require 'omniauth-oauth2'
require 'multi_json'

module OmniAuth
  module Strategies
    class Strava < OmniAuth::Strategies::OAuth2
      option :name, 'strava'
      option :client_options, {
        :site => 'https://strava.com/',
        :authorize_url => 'https://www.strava.com/oauth/authorize',
        :token_url => 'https://www.strava.com/oauth/token'
      }

      def authorize_params
        super.tap do |params|
          params[:approval_prompt] = 'auto'
        end
      end

      def request_phase
        super
      end

      def callback_phase
        super
      end
      
      uid { "#{athlete['id']}" }

      extra do
        {
          recent_ride_totals: athlete['recent_ride_totals'],
          ytd_ride_totals: athlete['ytd_ride_totals'],
          all_ride_totals: athlete['all_ride_totals'],
          raw_info: athlete
        }
      end

      info do
        {
          name: "#{athlete['firstname']} #{athlete['lastname']}",
          first_name: athlete['firstname'],
          last_name: athlete['lastname'],
          email: athlete['email'],
          location: "#{athlete['city']} #{athlete['state']}"
        }
      end

      def athlete
        access_token.options[:mode] = :query
        access_token.options[:param_name] = :access_token
        @athlete ||= MultiJson.load(access_token.get('/api/v3/athlete', { access_token: access_token.token }).body)
      end

    end
  end
end
