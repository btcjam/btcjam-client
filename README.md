# BTCJam API Client Demo

This app is an example of a BTCJam API OAuth2 client.
It uses [rails](http://github.com/rails/rails/), [devise](http://github.com/plataformatec/devise)
and [omniauth](http://github.com/intridea/omniauth) gems. OAuth2
strategy is build on top of [abstract OAuth2 strategy for OmniAuth](https://github.com/intridea/omniauth-oauth2)

## About the BTCJam API

For more information about the API check [here](https://btcjam.com/faq/api),
this project is hosted [here](https://github.com/btcjam/btcjam-client).

This app is live [here](http://btcjam-client.herokuapp.com/).

The user info returned currently is:

    info['alias']
    info['country']
    info['positive_count_reputation']
    info['negative_count_reputation]
    info['positive_percentage_reputation']
    info['can_borrow']
    info['can_trade']
    info['btcjam_score']
    info['bitcointalk_account_verified']
    info['address_verified']
    info['identity_verified']
    info['phone_verified']
    info['facebook_connected']
    info['facebook_friend_count']
    info['linkedin_connected']
    info['ebay_connected']
    info['ebay_account_date']
    info['ebay_feedback_score']
    info['paypal_verified_account_connected']
    info['paypal_account_date']
    info['repaid_loans_count']
    info['repaid_loans_amount']
    info['late_loans_count']
    info['open_credit_lines_count']
    info['open_credit_lines_amount']
    info['made_late_payments_count']
    info['balance']

## Installation & Configuration

If you want to run the application by yourself here are the steps for you.

First you need to clone the [repository from GitHub](http://github.com/btcjam/btcjam-client)

    git clone git://github.com/btcjam/btcjam-client.git

Install all the gems

    bundle install

And migrate the databse

    rake db:migrate

At this point the application should be ready to run, but it won't
communicate correctly with the provider.

Go to [BTCJam](https://btcjam.com) and register your application using the settings
tab at the dashboard.

The callback url for this application will look like this

    http://localhost:3000/users/auth/btcjam/callback

You need to set up environment
variables to indicate the oauth2 provider values. In your environemnt
file set up these variables

    BTCJAM_APP_ID = "375c2e3fd..." # ID for your app registered at BTCJam
    BTCJAM_APP_SECRET = "6a2fa82ab..." # Secret
    BTCJAM_APP_URL = "https://btcjam.com" # BTCJam API URL


Now you are ready to start the app

    rails s


## License

Copyright (c) 2013 by Ovo Cósmico

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.




