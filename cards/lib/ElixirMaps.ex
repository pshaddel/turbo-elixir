defmodule ElixirMaps do
  def use_map do
    ourMap = %{ name: "poorshad", family: "shaddel" }
    ourMap.name
  end

  def map_pattern_matching do
    ourMap = %{ name: "poorshad", family: "shaddel" }
    %{ name: myName } = ourMap
    myName
  end

  def map_update do
    myMap = %{name: "Poorshad" }
    myMap = Map.put(myMap, :name, "Hasan")
    myMap
  end

  def map_set_new do
    myMap = %{ name: "Khodadad" }
    Map.put_new(myMap, :family, "Azizi")
  end
end