class Student < ApplicationRecord
    has_one :library_ticket
    belongs_to :user
    has_and_belongs_to_many :subjects
    validates :first_name, :last_name, presence: true
    has_many :marks, dependent: :destroy

    def notify_student
        sleep 10
    end

end
