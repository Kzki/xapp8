class Main < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :feed
  default_scope -> { order('created_at DESC') }
  validates_uniqueness_of :feed_id, :scope => :user_id
end