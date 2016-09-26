defmodule PetStore.Repo.Migrations.CreatePet do
  use Ecto.Migration

  def change do
    create table(:pets) do
      add :name, :string, null: false
      add :type, :string, null: false

      timestamps()
    end

  end
end
