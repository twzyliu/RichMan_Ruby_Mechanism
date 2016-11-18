require_relative 'place'

class Hospital < Place
  HOSPITAL_DAYS = 3

  def hospital_days
    HOSPITAL_DAYS
  end

end