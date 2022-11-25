defmodule AgeCalculator do
  def calculate_age(birthdate) do
    age_return_type = Application.get_env(:age_calculator, :age_return_type)

    birthdate_str = String.split(birthdate, "-")
    birthdate_str = Enum.at(birthdate_str, 0)
    birthdate_int = String.to_integer(birthdate_str)
    current_year_int = DateTime.utc_now().year
    age = current_year_int - birthdate_int

    if age_return_type == "string" do
      "#{age}"
    else
      age
    end
  end
end
