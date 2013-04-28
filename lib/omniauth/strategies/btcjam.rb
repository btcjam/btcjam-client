module OmniAuth
  module Strategies
    class Btcjam < OmniAuth::Strategies::OAuth2
      option :name, :btcjam

      option :client_options, {
        :site => "http://localhost:3000",
        :authorize_path => "/oauth/authorize"
      }

      uid do
        raw_info['user']["id"]
      end

      info do
        {
          :alias => raw_info['user']["alias"],
          :country => raw_info['user']["country"],
          :positive_count_reputation => raw_info['user']["positive_count_reputation"],
          :negative_count_reputation => raw_info['user']["negative_count_reputation"],
          :positive_percentage_reputation => raw_info['user']["positive_percentage_reputation"],
          :can_borrow => raw_info['user']["can_borrow"],
          :can_trade => raw_info['user']["can_trade"],
          :btcjam_score => raw_info['user']["btcjam_score"],
          :bitcointalk_account_verified => raw_info['user']["bitcointalk_account_verified"],
          :address_verified => raw_info['user']["address_verified"],
          :identity_verified => raw_info['user']["identity_verified"],
          :phone_verified => raw_info['user']["phone_verified"],
          :facebook_connected => raw_info['user']["facebook_connected"],
          :facebook_friend_count => raw_info['user']["facebook_friend_count"],
          :linkedin_connected => raw_info['user']["linkedin_connected"],
          :ebay_connected => raw_info['user']["ebay_connected"],
          :ebay_account_date => raw_info['user']["ebay_account_date"],
          :ebay_feedback_score => raw_info['user']["ebay_feedback_score"],
          :paypal_verified_account_connected => raw_info['user']["paypal_verified_account_connected"],
          :paypal_account_date => raw_info['user']["paypal_account_date"],
          :repaid_loans_count => raw_info['user']["repaid_loans_count"],
          :repaid_loans_amount => raw_info['user']["repaid_loans_amount"],
          :late_loans_count => raw_info['user']["late_loans_count"],
          :open_credit_lines_count => raw_info['user']["open_credit_lines_count"],
          :open_credit_lines_amount => raw_info['user']["open_credit_lines_amount"],
          :made_late_payments_count => raw_info['user']["made_late_payments_count"]
        }
      end

      def raw_info

        @raw_info ||= access_token.get('/api/v1/me.json').parsed

      end
    end
  end
end
