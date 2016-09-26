defmodule PetStore.Pet do
  use PetStore.Web, :model

  @types ["cat", "dog"]
  schema "pets" do
    field :name, :string
    field :type, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :type])
    |> validate_required([:name, :type])
    |> validate_inclusion(:type, @types)
  end
end
