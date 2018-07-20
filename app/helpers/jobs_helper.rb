module JobsHelper

  def display_date(date)
    date.strftime("%a, %b %d, %Y")
  end
end
