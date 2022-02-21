class CreateSnowLog < ActiveRecord::Migration[6.1]
  def change
    create_table :snow_logs do |t|
      t.integer :inches, null: false, unique: true
      t.belongs_to :zipcode, null: false
      
      t.timestamps
    end
  end
end
