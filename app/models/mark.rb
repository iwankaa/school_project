class Mark < ApplicationRecord
  belongs_to :student
  validates :subject, :mark, presence: true
end
