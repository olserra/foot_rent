class Review < ApplicationRecord
  belongs_to :player
  belongs_to :club
end
