class Sbsc < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :site
  validates_uniqueness_of :site_id, :scope => :user_id
end
