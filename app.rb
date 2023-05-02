# first we import sinatra so we have access to its 
# objects and methods
require 'sinatra'

# `settings` is defined in sinatra we want to also 
# allow the live preview to reload on changes if we 
# are in development mode
if settings.development?
  require "sinatra/reloader"
end

# we use the `set` method with the :port argument to 
# set what port our live preview shows when we run 
# `ruby app.rb`
set(:port, 3000)

# we define our first route with sinatra's get method
get('/') do
  # we can pass plain text
  # "Hello, world!"

  # we can pass HTML
  "<h1>Hello, world!</h1>"
end
