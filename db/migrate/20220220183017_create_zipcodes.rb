class CreateZipcodes < ActiveRecord::Migration[6.1]
  def change
    create_table :zipcodes do |t|
      t.string :zipcode, null: false

      t.timestamps
    end
  end
end
