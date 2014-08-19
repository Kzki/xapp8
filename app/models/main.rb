class Main < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :article, :foreign_key => "atcl_id"
  default_scope -> { order('created_at DESC') }
end
