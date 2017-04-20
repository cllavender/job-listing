class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  belongs_to :user
  has_many :job_relationships
  has_many :admins, through: :job_relationships, source: :user
  has_many :resumes
  
end
