class Exercise < ApplicationRecord
  validates :Name, presence: true
  validates :Amount, numericality: { greater_than_or_equal_to: 0 }

  scope :grouped, -> { joins(:categories) }
  scope :not_grouped, -> { left_outer_joins(:categories).where('categories.group_id' => nil ) }

  belongs_to :user, class_name: 'User', foreign_key: :AuthorId
  has_many :categories
  has_many :groups, through: :categories
end
