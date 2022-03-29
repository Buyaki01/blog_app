class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
  def current_user
    User.first
  end
end
