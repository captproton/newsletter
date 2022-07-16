module Newsletter
  class Asset < ApplicationRecord
    belongs_to :newsletter_field
    belongs_to :newsletter_piece
  end
end
