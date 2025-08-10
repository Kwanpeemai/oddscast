class Video < ApplicationRecord
  has_one :content, as: :contentable, dependent: :destroy
end
