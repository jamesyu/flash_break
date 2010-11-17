# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_flash_break_session',
  :secret      => '5bb7231e682e444064b6e0975dc114699239be4045dad9fb18058ad52965f11304cc0dcbc9c8c1f52b7aedcfb002f04a708b02babdee44218af88298017c2765'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
