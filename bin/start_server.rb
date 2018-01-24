require 'rack'
require_relative '../lib/router'
require_relative '../lib/static'
require_relative '../lib/show_exceptions'

require_relative '../app/controllers/desserts_controller'

router = Router.new
router.draw do
  get Regexp.new("^/$"), DessertsController, :to_index
  get Regexp.new("^/feed$"), DessertsController, :index
  get Regexp.new("^/desserts$"), DessertsController, :to_index
  get Regexp.new("^/desserts/new$"), DessertsController, :new
  get Regexp.new("^/desserts/(?<id>\\d+)$"), DessertsController, :show
  post Regexp.new("^/desserts$"), DessertsController, :create
end

app = Proc.new do |env|
  req = Rack::Request.new(env)
  res = Rack::Response.new
  router.run(req, res)
  res.finish
end

app = Rack::Builder.new do
  use ShowExceptions
  use Static
  run app
end.to_app

Rack::Server.start(
  app: app,
  Port: 3000
)
