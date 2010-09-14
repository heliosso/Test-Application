# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_webhook_receiver_session',
  :secret      => 'cb67497dfe5de37f0ff79d8b70fdb1aba6aae5f9f8ac43a8f905b38f17a8ccf4edcfc20487c1425c698a298e65f37bba1dcb5334dc4d310dd06c857bf28b7eb6'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
