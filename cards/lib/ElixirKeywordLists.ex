defmodule ElixirKeywordLists do

  def keyword_list do
    colors = [{:primary, "red"}, {:secondary, "blue"}]
    colors[:primary]
  end

  def keyword_list_different_defining do
    colors = [primary: "red", secondary: "blue"]
    colors[:primary]
  end

def keyword_list_variable_more_than_once do
    colors = [primary: "red", primary: "blue"]
    colors[:primary]
end

end