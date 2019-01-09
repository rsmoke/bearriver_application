class AddReservationToLodging < ActiveRecord::Migration[5.2]
  def change
    add_reference :lodgings, :reservation, foreign_key: true
  end
end
