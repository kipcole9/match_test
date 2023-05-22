defmodule Matchtest do

  # These strings are sorted longest to shortest and function
  # are generated in this order so that any match is always the
  # longest match.

  @units [
     "kilogram_square_meter_per_cubic_second_square_ampere",
     "kilogram_square_meter_per_cubic_second_ampere",
     "kilogram_square_meter_per_square_second",
     "kilogram_per_square_meter_square_second",
     "kilogram_square_meter_per_cubic_second",
     "candela_square_meter_per_square_meter", "kilogram_per_meter_square_second",
     "kilogram_meter_per_square_second", "candela_per_square_meter",
     "meter_per_square_second", "dessert_spoon_imperial", "revolution_per_second",
     "british_thermal_unit", "fluid_ounce_imperial", "item_per_kilogram",
     "astronomical_unit", "mile_scandinavian", "solar_luminosity",
     "meter_per_second", "gallon_imperial", "quart_imperial", "nautical_mile",
     "100_kilometer", "dessert_spoon", "earth_radius", "electronvolt",
     "solar_radius", "square_meter", "month_person", "pound_force", "foodcalorie",
     "fluid_ounce", "cubic_meter", "year_person", "pint_metric", "week_person",
     "cup_metric", "permillion", "arc_minute", "light_year", "tablespoon",
     "fahrenheit", "solar_mass", "arc_second", "day_person", "revolution",
     "earth_mass", "horsepower", "ounce_troy", "atmosphere", "permyriad",
     "ofglucose", "teaspoon", "kilogram", "therm_us", "permille", "vehicle",
     "candela", "calorie", "hectare", "portion", "quarter", "g_force", "furlong",
     "percent", "celsius", "century", "radian", "barrel", "minute", "decade",
     "pascal", "jigger", "ampere", "kelvin", "gallon", "degree", "person", "newton",
     "dalton", "second", "fathom", "parsec", "bushel", "quart", "point", "joule",
     "pound", "ounce", "month", "liter", "grain", "meter", "lumen", "karat",
     "stone", "dunam", "hertz", "pixel", "carat", "pinch", "tonne", "year", "acre",
     "mile", "unit", "byte", "dram", "watt", "mole", "inch", "yard", "volt", "week",
     "pint", "drop", "gram", "foot", "hour", "knot", "item", "ofhg", "ton", "ohm",
     "dot", "day", "bar", "bit", "lux", "cup", "em"
  ]

  def units_in_length_order do
    IO.puts "These are the units in order, longest to shortest"
    IO.puts "Functions are generated in this order so that"
    IO.puts "the longest match takes priority."
    @units
  end

  for unit <- @units do
    def match_test_1(<<unquote(unit), rest::binary>> = full_unit) do
      if rest == "" do
        # Correctly matched theunit
        # IO.inspect unquote(unit), label: "Found exact match"
      else
        IO.puts "FAILURE Found only partial match for #{full_unit}. Found #{inspect unquote(unit)}. Rest = #{inspect rest}"
      end
    end
  end

  def match_test_1(unit) do
    IO.inspect unit, label: "Found no match"
  end

  for unit <- @units do
    def match_test_2(<<unquote(unit)>>) do
      :ok
    end
  end

  def match_test_2(unit) do
    IO.puts "No match found for #{inspect unit}"
  end

  def test_1 do
    IO.puts "Output one line for each partial match that should have been a full match. There should be no output:"
    for unit <- @units do
      match_test_1(unit)
    end
    :ok
  end

  def test_2 do
    IO.puts "Output one line for each full match that failed. There should be no output:"
    for unit <- @units do
      match_test_2(unit)
    end
  end

  def test do
    test_1()
    IO.puts ""
    test_2()
    IO.puts ""
    IO.puts "Done."
  end

end
