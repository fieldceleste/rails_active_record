class ApplicationRecord < ActiveRecord::Base
  # current_user.update_attribute :admin, true
  self.abstract_class = true
end
