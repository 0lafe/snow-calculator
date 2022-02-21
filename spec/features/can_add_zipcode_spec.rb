require 'rails_helper'

describe "user can add a zipcode" do

    it "when clicking add new zipcode you can add one" do

        visit root_path
        click_link "Add New Zipcode"
        fill_in "Zipcode", with: "02446"
        click_button "Add Zipcode"
        expect(page).to have_content('Zipcode successfully Added!')
        expect(page).to have_content('02446')

    end

end