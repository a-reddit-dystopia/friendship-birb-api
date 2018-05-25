class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :discord_name
      t.string :wow_name
      t.string :wow_server
      t.string :status, default: 'needs_birb'
      t.datetime :status_date

      t.timestamps
    end
  end
end
