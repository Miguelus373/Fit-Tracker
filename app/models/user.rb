class User < ApplicationRecord
  validates :Name, presence: true, uniqueness: true, length: { maximum: 16 }
  validates :icon, presence: true

  has_many :groups
  has_many :exercises, foreign_key: :AuthorId
end
