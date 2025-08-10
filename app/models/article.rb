class Article < ApplicationRecord
    has_one_attached :cover_image

    enum :status, [ :draft, :wating_for_review, :published ]
end
