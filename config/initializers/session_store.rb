# Be sure to restart your server when you modify this file.

<<<<<<< HEAD
Blog::Application.config.session_store :cookie_store, key: '_blog_session'
=======
Blog::Application.config.session_store :cookie_store, :key => '_blog_session'
>>>>>>> af435c4bc5467c40a503b053920c1a7a3dddb6f4

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Blog::Application.config.session_store :active_record_store
