defmodule PetStore.Router do
  use PetStore.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/v1", PetStore do
    pipe_through :api
    resources "/stores", StoreController, only: [:index]
    resources "/pets", PetController, except: [:new, :edit]
  end
end
