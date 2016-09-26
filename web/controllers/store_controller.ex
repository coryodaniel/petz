defmodule PetStore.StoreController do
  use PetStore.Web, :controller

  alias PetStore.Store

  def index(conn, _params) do
    stores = Repo.all(Store)
    render(conn, "index.json", stores: stores)
  end
end
