# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Zipcode.delete_all
SnowLog.delete_all
zipcodes = ["02446", "02101", "02108", "02121", "02118", "02445"]
zipcodes.each do |zc|
    zipcode = Zipcode.create(zipcode: zc)
    if zipcode.valid?
        zipcode.save
        2.times do
            SnowLog.create(inches: rand(24), zipcode: zipcode)
        end
    end
end
