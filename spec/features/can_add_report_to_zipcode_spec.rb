require 'rails_helper'

describe "user can add a snow log" do

    it "when clicking add new zipcode you can add one" do

        Zipcode.create(zipcode: "02446")
        visit root_path
        click_link "Reports"
        click_link "Add Log"
        fill_in "Inches", with: "10"
        click_button "Add Log"
        expect(page).to have_content('Log successfully saved')

    end

end