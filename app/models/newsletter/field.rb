module Newsletter
  class Field < ApplicationRecord
    belongs_to :element
  end
end
