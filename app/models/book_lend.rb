class DateValidator < ActiveModel::Validator

  def validate(record)
    if record.start_date > record.end_date
      record.errors.add :base, "Se debe seleccionar una fecha futura"
    end
  end

end




class BookLend < ApplicationRecord

  


  belongs_to :user
  belongs_to :book
  validates_with DateValidator
end
