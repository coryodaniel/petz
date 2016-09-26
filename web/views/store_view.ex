defmodule PetStore.StoreView do
  use PetStore.Web, :view

  def render("index.json", %{stores: stores}) do
    render_many(stores, PetStore.StoreView, "store.json")
  end

  def render("show.json", %{store: store}) do
    render_one(store, PetStore.StoreView, "store.json")
  end

  def render("store.json", %{store: store}) do
    %{id: store.id,
      address: store.address,
      city: store.city,
      state: store.state,
      postal_code: store.postal_code}
  end
end
