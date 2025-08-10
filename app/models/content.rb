class Content < ApplicationRecord
  belongs_to :contentable, polymorphic: true
  has_many :comments, dependent: :destroy
end
