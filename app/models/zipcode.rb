class Zipcode < ApplicationRecord

    validates :zipcode, length: { is: 5 }
    validates :zipcode, uniqueness: true

    validates_with ZipcodeValidator

    has_many :snow_logs

    def highest_snowfall
        total = 0
        self.snow_logs.each do |log|
            if log.inches > total
                total = log.inches
            end
        end
        total
    end

end

