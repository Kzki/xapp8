class Main < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :feed
  default_scope -> { order('created_at DESC') }
  validates_uniqueness_of :feed_id, :scope => :user_id
  
  # ログインユーザのレコードを抽出
  scope :own, lambda { |uid| where("user_id = ?", "#{uid}") }
  # 未読のレコードを抽出
  scope :unread, lambda { where(read_flg: false) } 
  
end