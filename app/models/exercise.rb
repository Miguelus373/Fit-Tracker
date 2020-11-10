class Exercise < ApplicationRecord
  validates :Name, presence: true
  validates :time, presence: true
  validates :Amount, :distance, :time, numericality: { greater_than: 0, allow_nil: true }

  scope :grouped, -> { joins(:categories) }
  scope :not_grouped, -> { left_outer_joins(:categories).where('categories.group_id' => nil ) }
  scope :total_time, -> { sum(:time) }

  belongs_to :user, class_name: 'User', foreign_key: :AuthorId
  has_many :categories
  has_many :groups, through: :categories

end
