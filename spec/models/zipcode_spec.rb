require 'rails_helper'

RSpec.describe Zipcode, type: :model do

    describe "when creating a zipcode" do

        it "should require a length of 5 characters" do

            zipcode = Zipcode.new(zipcode: "")
            expect(zipcode.valid?).to eq(false)
            expect(zipcode.errors.full_messages.include?("Zipcode is the wrong length (should be 5 characters)")).to eq(true)
        
        end

        it "needs to be unique" do

            Zipcode.create(zipcode: "00000")
            zipcode = Zipcode.new(zipcode: "00000")
            expect(zipcode.valid?).to eq(false)
            expect(zipcode.errors.full_messages.include?("Zipcode has already been taken")).to eq(true)

        end

    end

end