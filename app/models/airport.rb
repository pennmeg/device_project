class Airport < ApplicationRecord
    has_many :jobs_as_origin, :class_name => 'Job', :foreign_key => 'origin_id'
    has_many :jobs_as_destination, :class_name => 'Job', :foreign_key => 'destination_id'
    has-many :airplanes
end
