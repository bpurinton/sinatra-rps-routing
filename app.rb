# first we import sinatra so we have access to its 
# objects and methods
require 'sinatra'

# `settings` is defined in sinatra we want to also 
# allow the live preview to reload on changes if we 
# are in development mode
if settings.development?
  require "sinatra/reloader"

  # we would also like a nicer error page in development
  require 'better_errors'
  require 'binding_of_caller'
  use(BetterErrors::Middleware)
  BetterErrors.application_root = __dir__
  BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')
end

# we use the `set` method with the :port argument to 
# set what port our live preview shows when we run 
# `ruby app.rb`
set(:port, 3000)

# To open .html.erb files, need to register them
Tilt.register(Tilt::ERBTemplate, 'html.erb')

# we define our first route with sinatra's get method
get('/') do
  # we can pass plain text
  # "Hello, world!"

  # we can pass HTML
  "<h1>Hello, world!</h1>"
end

# we can define another route to our rock page
get('/rock') do
  # we can simply redirect somewhere
  # redirect("https://www.wikipedia.org")

  # or we can render an html page from the root
  # send_file("rock.html")

  # but even better, we can make a views folder
  # and render a new type of file from there
  # we call the file "views/rock.html.erb"
  erb(:rock)
end
