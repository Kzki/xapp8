class Main < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :feed
  default_scope -> { order('created_at DESC') }
end
