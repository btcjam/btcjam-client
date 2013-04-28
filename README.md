# BTCJam API Client Demo

This app is an example of OAuth2 client. It was built in order to test
the [BTCJam OAuth2 API](http://btcjam-client.herokuapp.com/).
It uses [rails](http://github.com/rails/rails/), [devise](http://github.com/plataformatec/devise)
and [omniauth](http://github.com/intridea/omniauth) gems. OAuth2
strategy is build on top of [abstract OAuth2 strategy for OmniAuth](https://github.com/intridea/omniauth-oauth2)

## About BTCJam API

For more information [about the API](https://btcjam.com/api),
check out this project [on GitHub](https://github.com/btcjam/btcjam-client).

## Installation & Configuration

If you want to run the application by yourself here are the steps for
you.

First you need to clone the [repository from GitHub](http://github.com/btcjam/btcjam-client)

    git clone git://github.com/btcjam/btcjam-client.git

Install all the gems

    bundle install

And migrate the databse

    rake db:migrate

At this point the application should be ready to run, but it won't
communicate correctly with the provider. You need to set up environment
variables to indicate the oauth2 provider values. In your environemnt
file set up these variables

    BTCJAM_APP_ID = "375c2e3fd..." # ID for your app registered at BTCJam
    BTCJAM_APP_SECRET = "6a2fa82ab..." # Secret
    BTCJAM_APP_URL = "https://btcjam.com" # BTCJam API URL


Now you are ready to start the app

    rails s




