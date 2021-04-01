class CreateFoodcarts < ActiveRecord::Migration[6.1]
  def change
    create_table :foodcarts do |t|
      t.string :user_id

      t.timestamps
    end
  end
end
