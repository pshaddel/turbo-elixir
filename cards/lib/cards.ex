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
    cards = for suit <- suits do
      for value <- values do
        newValue = value <> " " <> suit
      end
    end
    List.flatten(cards)
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
end
