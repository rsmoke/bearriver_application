class Gender < ApplicationRecord

  def display_name
    self.name # or whatever column you want
  end
end
