require 'rails_helper'

RSpec.describe SnowLog, type: :model do

    describe "when creating a snow log" do

        it "needs to be a number and greater than 0" do

            zipcode = Zipcode.create(zipcode: "00000")
            log1 = SnowLog.new(zipcode: zipcode, inches: -1)
            log2 = SnowLog.new(zipcode: zipcode, inches: "abcd")
            expect(log1.valid?).to eq(false)
            expect(log2.valid?).to eq(false)

        end

    end

end