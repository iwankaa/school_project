class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :contacts
      t.string :grade
      t.belongs_to :parent, foreign_key: true

      t.timestamps
    end
  end
end
