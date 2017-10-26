class Job < ApplicationRecord
    belongs_to :origin, :class_name => 'Airport'
    belongs_to :destination, :class_name => 'Airport'
    has_many :job_planes
    has_many :airplanes, through: :job_planes
end
