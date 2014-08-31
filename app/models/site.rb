class Site < ActiveRecord::Base
  has_many :sbscs, dependent: :destroy
  VALID_URL_REGEX = /https?\:\/\/[^ ]*/i
  validates :rss_url,  presence: true, format: { with: VALID_URL_REGEX }, uniqueness: { case_sensitive: false }
#  validates :url,  presence: true, uniqueness: { case_sensitive: false }

end
