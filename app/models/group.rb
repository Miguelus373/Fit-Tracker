class Group < ApplicationRecord
  validates :Name, presence: true
  validates :Icon, presence: true

  belongs_to :user
  has_many :categories
  has_many :exercises, through: :categories
end
