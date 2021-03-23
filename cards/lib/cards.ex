defmodule Cards do
  @moduledoc """
  Documentation for `Cards`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Cards.hello()
      :world

  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Five"]
    suits = ["Spades", "Clubs", "Heart", "Diamonds"]
    for suit <- suits, value <- values do
        newValue = value <> " " <> suit
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains(deck, element) do
    result = Enum.find(deck, fn x -> x == element end)
    if result do
      true
    else
      false
    end
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      { :ok, binary } -> :erlang.binary_to_term(binary)
      { :error, _reason } -> "File does not exist."
    end
  end
end
