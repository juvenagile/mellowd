class RenameLocationToAddressInEvents < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :location, :address
  end
end
