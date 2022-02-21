require 'rails_helper'

describe "user" do

    it "can find a zipcode when it exists" do

        Zipcode.create(zipcode: "00000")

        visit root_path
        fill_in "Zipcode Search", with: "00000"
        click_button "Search"

        expect(page).to have_content("Logs for 00000")

    end

    it "is met with an error when that zipcode hasnt been added yet" do

        visit root_path
        fill_in "Zipcode Search", with: "11111"
        click_button "Search"

        expect(page).to have_content("Zipcode isn't stored.... yet!")

    end

end