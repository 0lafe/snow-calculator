class ZipcodeValidator < ActiveModel::Validator
    def validate(record)
        striped = record.zipcode.to_i.to_s
      unless record.zipcode == "0" * (5 - striped.length) + striped
        record.errors.add :zipcode, "is not valid (Needs to be 5 numbers)"
      end
    end
end