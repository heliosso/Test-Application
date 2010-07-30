# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_job-application_session',
  :secret      => '413af5cf2fa82cb34973c37eee97c49aa64bc50dc5348aecd10541e4e03b9d303f9606c935ef054bd42bf935a5a1c31b89b3c6fe6dbecbde21cdb6e1b894ae6b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
