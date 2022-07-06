# joins two models with has_many through
module Newsletter
  class AreaElement < ApplicationRecord
    belongs_to :area, :class_name => 'Newsletter::Area'
    belongs_to :element, :class_name => 'Newsletter::Element'
  end
end
