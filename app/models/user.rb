class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jobs
  has_many :job_relationships
  has_many :created_jobs, :through => :job_relationships, :source => :job
  has_many :resumes

  def admin?
    is_admin
  end

end
