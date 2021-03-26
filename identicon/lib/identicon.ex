defmodule Identicon do
  def main(input) do
    input
    |> hash_input
  end

  @doc """
    This method returns a list of numbers for each string we pass to it as argument

    ## Examples

        iex> Identicon.hash_input("poorshad")
        %Identicon.Image{ hex: [16, 40, 170, 200, 230, 126, 92, 128, 146, 199, 167, 122, 192, 17, 32, 105]}

  """
  def hash_input(input) do
    hash = :crypto.hash(:md5, input)
    |> :binary.bin_to_list
    %Identicon.Image{hex: hash}
  end


  def color_input(list) do

  end
end
