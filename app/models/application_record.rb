class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  protected
  def check_email(object)
     if object.find_by(email: self.email)
       errors.add(:oleg_the_best_one, "This email is not availabe")
    end
  end
end
