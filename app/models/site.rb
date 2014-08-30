class Site < ActiveRecord::Base
  VALID_URL_REGEX = /https?\:\/\/[^ ]*/i
  validates :rssurl,  presence: true, format: { with: VALID_URL_REGEX }, uniqueness: { case_sensitive: false }
#  validates :url,  presence: true, uniqueness: { case_sensitive: false }

end
