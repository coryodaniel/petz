defmodule Apocryphal.Case do
  use ExUnit.CaseTemplate

  using do
    quote do
      import Apocryphal.Transaction
      import Apocryphal.Assertions
      use ExUnit.Case, async: true

      import Ecto.Model
      import Ecto.Query, only: [from: 2]

      alias PetStore.Repo
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(PetStore.Repo)
    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(PetStore.Repo, {:shared, self()})
    end
    :ok
  end
end
