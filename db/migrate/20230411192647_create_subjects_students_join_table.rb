class CreateSubjectsStudentsJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :subjects, :students do |t|
      t.index :subject_id
      t.index :student_id
    end
  end
end
