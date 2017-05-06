class Job < ApplicationRecord
  validates :title, presence: true
  validates :wage_upper_bound, presence: true
  validates :wage_lower_bound, presence: true
  validates :job_type, presence: true
  validates :wage_lower_bound, numericality: { greater_than: 0}
  belongs_to :user
  has_many :job_relationships
  has_many :members, through: :job_relationships, source: :user
  has_many :resumes

  def publish!
    self.is_hidden = false
    self.save
  end

  def hide!
    self.is_hidden = true
    self.save
  end

  def baker?
    self.jobs_type == '西点师'
  end

  def frieddish?
    self.jobs_type == '热炒师'
  end

  def colddish?
    self.jobs_type == '冷菜师'
  end

  def admin?
    self.jobs_type == '管理'
  end

  def logistics?
    self.jobs_type == '后勤'
  end



end
