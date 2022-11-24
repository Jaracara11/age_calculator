defmodule AgeCalculator do
  @moduledoc """
  crear un endpoint /age/:birthday donde al enviar la fecha de cumple,
  te diga la edad. El response debe ser 'application/json', e.g. {"age": 21}
  y solo usando Plug (no phoenix), usar version 1.14 de elixir y hacer un release
  donde exista una variable de ambiente en la cual se pueda configurar si la fecha
  en el response sea un integer o un string.
  Formato del url param:
  "YYYY-MM-DD"
  "DD-MM-YYYY"
  ISO 8601
  """
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
