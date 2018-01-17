require_relative './application_record'
require_relative './hungry_hippo'

class Dessert < ApplicationRecord
  self.finalize!

  belongs_to :hungry_hippo
end
