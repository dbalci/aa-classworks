class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true, uniqueness: true
    validates :short_url
end
