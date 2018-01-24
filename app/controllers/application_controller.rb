require_relative '../../lib/controller_base.rb'

class ApplicationController < ControllerBase
  self.protect_from_forgery
end
