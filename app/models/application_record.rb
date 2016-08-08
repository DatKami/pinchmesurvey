# Public: A base model for application records.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
