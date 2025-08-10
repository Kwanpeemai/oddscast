class Article < ApplicationRecord
    has_one_attached :cover_image

    enum :status, [ :draft, :wating_for_review, :published ]

    has_one :content, as: :contentable, dependent: :destroy
    accepts_nested_attributes_for :content
    delegate :title, to: :content, allow_nil: true

    has_many :comments, through: :content
end
