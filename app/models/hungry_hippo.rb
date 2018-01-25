require_relative './application_record'
require_relative './dessert'

class HungryHippo < ApplicationRecord
  self.finalize!

  def color
    if self.desserts.count < 3
      return 'red'
    elsif self.desserts.count < 5
      return 'black'
    else
      return 'green'
    end
    return 'blue'
  end

  has_many :desserts
end
