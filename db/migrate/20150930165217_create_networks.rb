class CreateNetworks < ActiveRecord::Migration
  def change
    create_table :networks do |t|
      t.string :essid
      t.string :bssid
      t.string :band
      t.string :channel
      t.string :security_type
      t.string :is_wps
      t.string :longitude
      t.string :latitude
      t.string :first_seen
      t.string :last_seen
      t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
