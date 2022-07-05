module Newsletter
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
    table_name_prefix= "newsletter_"
  end
end
