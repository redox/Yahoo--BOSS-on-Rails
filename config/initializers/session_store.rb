# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_metasearch_session',
  :secret      => 'a83804a64f0ba2a3cc3550ef4148c1d6625015971c1cd1a743af23439bb444083e2a81c00f612f2c8b31dbc2f56d21a57e7a9f8605fc97c80bde2cda6f511998'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
