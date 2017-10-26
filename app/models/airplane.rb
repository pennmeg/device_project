class Airplane < ApplicationRecord
  belongs_to :user
  belongs_to :airport
  belongs_to :photo
  has_many :job_planes
  has_many :jobs, through: :job_planes
end
