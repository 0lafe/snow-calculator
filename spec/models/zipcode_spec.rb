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

        it "needs to be numeric" do

            zipcode = Zipcode.new(zipcode: "123de")
            expect(zipcode.valid?).to eq(false)
            expect(zipcode.errors.full_messages.include?("Zipcode is not valid (Needs to be 5 numbers)")).to eq(true)
        
        end

    end

    describe "highest_snowfall" do

        it "should return the highest snowfall for a given record" do

            zipcode = Zipcode.create(zipcode: "00000")
            
            SnowLog.create(zipcode: zipcode, inches: 10)
            SnowLog.create(zipcode: zipcode, inches: 10000)

            10.times do
                SnowLog.create(zipcode: zipcode, inches: rand(10000))
            end

            expect(zipcode.highest_snowfall).to eq(10000)

        end

    end

end