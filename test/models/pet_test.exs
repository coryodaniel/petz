defmodule PetStore.PetTest do
  use PetStore.ModelCase

  alias PetStore.Pet

  @valid_attrs %{name: "Chauncy", type: "cat"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Pet.changeset(%Pet{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Pet.changeset(%Pet{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "setting an invalid pet type" do
    changeset = Pet.changeset(%Pet{}, %{type: "pupperino"})
    refute changeset.valid?
  end
end
