json.extract! student, :id, :first_name, :last_name, :contacts, :grade, :created_at, :updated_at
json.url student_url(student, format: :json)
