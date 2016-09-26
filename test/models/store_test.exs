defmodule PetStore.StoreTest do
  use PetStore.ModelCase

  alias PetStore.Store

  @valid_attrs %{address: "some content", city: "some content", postal_code: "some content", state: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Store.changeset(%Store{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Store.changeset(%Store{}, @invalid_attrs)
    refute changeset.valid?
  end
end
