class Job < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  has_many :job_relationships
  has_many :admins, through: :job_relationships, source: :user
end
