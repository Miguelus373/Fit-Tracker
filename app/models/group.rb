class Group < ApplicationRecord
  validates :Name, presence: { message: 'is missing. Please add a name' }
  validates :Icon, presence: { message: 'is missing. Please select an icon' }

  belongs_to :user
  has_many :categories
  has_many :exercises, through: :categories
end
