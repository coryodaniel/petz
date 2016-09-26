defmodule PetStore.Store do
  use PetStore.Web, :model

  schema "stores" do
    field :address, :string
    field :city, :string
    field :state, :string
    field :postal_code, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:address, :city, :state, :postal_code])
    |> validate_required([:address, :city, :state, :postal_code])
  end
end
