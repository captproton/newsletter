# joins two models with has_many through
module Newsletter
  class AreaElement < ApplicationRecord
    belongs_to :newsletter_area
    belongs_to :newsletter_element
  end
end
