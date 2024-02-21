class LibraryTicket < ApplicationRecord
  belongs_to :student, optional: true
end
