defmodule PetStore.PetView do
  use PetStore.Web, :view

  def render("index.json", %{pets: pets}) do
    render_many(pets, PetStore.PetView, "pet.json")
  end

  def render("show.json", %{pet: pet}) do
    render_one(pet, PetStore.PetView, "pet.json")
  end

  def render("pet.json", %{pet: pet}) do
    %{id: pet.id,
      name: pet.name,
      type: pet.type}
  end
end
