class CreateMarks < ActiveRecord::Migration[7.0]
  def change
    create_table :marks do |t|
      t.string :subject
      t.integer :mark
      t.date :got_date
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
