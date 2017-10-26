class JobPlane < ApplicationRecord
  belongs_to :airplane
  belongs_to :job
end
