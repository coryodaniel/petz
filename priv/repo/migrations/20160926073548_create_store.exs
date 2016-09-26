defmodule PetStore.Repo.Migrations.CreateStore do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :address, :string
      add :city, :string
      add :state, :string
      add :postal_code, :string

      timestamps()
    end

  end
end
