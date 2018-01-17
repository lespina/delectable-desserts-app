require_relative './application_record'
require_relative './dessert'

class HungryHippo < ApplicationRecord
  self.finalize!

  has_many :desserts
end
