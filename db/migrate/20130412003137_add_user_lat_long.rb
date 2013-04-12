class AddUserLatLong < ActiveRecord::Migration
  def change
    add_column(:crawls, :user, :text)
    add_column(:crawls, :lat, :float)
    add_column(:crawls, :long, :float)
  end
end
