class CreateLibraryTickets < ActiveRecord::Migration[7.0]
  def change
    create_table :library_tickets do |t|
      t.string :book
      t.datetime :got_date
      t.datetime :back_date
      t.references :student, null: false, foreign_key: true

      t.timestamps
    end
  end
end
