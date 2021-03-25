defmodule Cards do
  @moduledoc """
  This module provides methods to handle `Cards` operations like shuffle and creates.
  """

  @doc """
  This method creates a full deck
  ## Examples
      iex> Cards.create_deck
      ["Ace Spades", "Two Spades", "Three Spades", "Five Spades", "Ace Clubs",
      "Two Clubs", "Three Clubs", "Five Clubs", "Ace Heart", "Two Heart",
      "Three Heart", "Five Heart", "Ace Diamonds", "Two Diamonds",
      "Three Diamonds", "Five Diamonds"]
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Five"]
    suits = ["Spades", "Clubs", "Heart", "Diamonds"]
    for suit <- suits, value <- values do
        newValue = value <> " " <> suit
    end
  end

  @doc """
  This method shuffles the cards of a `deck` and returns a `deck`
  ## Examples
      iex(2)> deck = Cards.create_deck
      ["Ace Spades", "Two Spades", "Three Spades", "Five Spades", "Ace Clubs",
      "Two Clubs", "Three Clubs", "Five Clubs", "Ace Heart", "Two Heart",
      "Three Heart", "Five Heart", "Ace Diamonds", "Two Diamonds",
      "Three Diamonds", "Five Diamonds"]
      iex> shuffled_deck = Cards.shuffle(deck)
      iex> shuffled_deck == deck
      false
      iex> Enum.member?(shuffled_deck, "Ace Spades")
      true
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
  This method checks if the card is in deck or not and returns a boolean(atom -> :true or :false)
  It has two arguments: `deck` and the `element` we want to check
  ## Examples
      iex> deck = ["a", "b", "c"]
      iex> Cards.contains(deck, "a")
      true
      iex> Cards.contains(deck, "d")
      false
  """
  def contains(deck, element) do
    result = Enum.find(deck, fn x -> x == element end)
    if result do
      true
    else
      false
    end
  end

  @doc """
  This method saves the deck in the file name that we give in arguments
  It has two arguments: `deck` and `filename` which is the name of the file that we want to save our data
  ## Examples
      iex> Cards.save(["simple", "deck"], "newFile")
      :ok
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
  This method loads a deck from the file that we give in the arguments
  It has one argument `filename` which is the name of the file that we want to read the deck.
  ## Examples
      iex> Cards.load("newFile")
      ["simple", "deck"]
      iex> Cards.load("newFileFFF")
      "File does not exist."
  """
  def load(filename) do
    case File.read(filename) do
      { :ok, binary } -> :erlang.binary_to_term(binary)
      { :error, _reason } -> "File does not exist."
    end
  end

  @doc """
  This method first creates a deck and after that shuffles it and return it.
  We use pipes to execute these two functionalities together
  ## Examples
      iex> hand = Cards.create_hand
      iex> deck = Cards.create_deck
      iex> hand == deck
      false
  """
  def create_hand do
    create_deck |> shuffle
  end
end
