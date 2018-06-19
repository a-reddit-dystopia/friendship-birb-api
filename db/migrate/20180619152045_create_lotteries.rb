class CreateLotteries < ActiveRecord::Migration[5.2]
  def change
    create_table :lotteries do |t|
      t.integer :user_id
      t.timestamps
    end
  end
end
