class Group < ApplicationRecord
  validates :Name, presence: true
  validates :Icon, presence: true

  belongs_to :user
end
