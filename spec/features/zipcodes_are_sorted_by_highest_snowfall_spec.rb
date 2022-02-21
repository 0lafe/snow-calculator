require 'rails_helper'

describe "zipcodes" do

    it "are sorted by highest amount of snow fall on index page" do

        i = 0
        10.times do
            zipcode = Zipcode.create(zipcode: i.to_s * 5) 
            SnowLog.create(zipcode: zipcode, inches: i)
            i += 1
        end

        visit root_path
        expect(page).to have_content("Highest Reported Snow Fall (in) 99999")
        
    end

end