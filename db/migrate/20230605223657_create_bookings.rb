class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.boolean :status
      t.date :date

      t.timestamps
    end
  end
end
