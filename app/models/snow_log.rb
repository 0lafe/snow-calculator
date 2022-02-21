class SnowLog < ApplicationRecord

    validates :inches, numericality: { greater_than_or_equal_to: 0 } 

    belongs_to :zipcode

end