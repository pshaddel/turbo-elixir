defmodule CardsTest do
  use ExUnit.Case
  doctest Cards
  test "create_deck should create a deck that contains 20 cards" do
    assert length(Cards.create_deck) == 16
  end

  test "shufflign a deck should shuffle the deck" do
    deck = Cards.create_deck;
    refute deck == Cards.shuffle(deck)
  end
end
