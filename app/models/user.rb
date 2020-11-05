class User < ApplicationRecord
  validates :Name, presence: true, length: { maximum: 16}
  
  has_many :groups
end
