defmodule Apocryphal.V1.PetAPITest do
  use Apocryphal.Case
  alias PetStore.Pet
  alias PetStore.Store

  @swagger "./docs/pet_store.yml"
  @mime "application/json"

  test "[GET] /stores (200)" do
    %Store{ address: "123 Ship St.",
            city: "Los Angeles",
            state: "CA",
            postal_code: "90210" } |> Repo.insert!

    @swagger
    |> Apocryphal.Transaction.get("/stores", 200, @mime)
    |> Apocryphal.Transaction.dispatch
    # |> (fn(tx) -> tx end).()
    |> assert_schema
  end

  test "[GET] /pets (200)" do
    %Pet{ name: "Chauncy", type: "dog" } |> Repo.insert!

    @swagger
    |> Apocryphal.Transaction.get("/pets", 200, @mime)
    |> put_in([:request, :params], [limit: 20])
    |> assert_schema
  end

  test "Make sweet pets" do
    pet_params = %{ pet: %{ name: "Chuancy", type: "cat" } }
    @swagger
    |> Apocryphal.Transaction.post("/pets", 201, @mime)
    |> put_in([:request, :body], pet_params)
    |> assert_schema
  end

  test "[POST] /pets 422" do
    pet_params = %{ pet: %{ name: "Doge", type: "pupperino" } }
    @swagger
    |> Apocryphal.Transaction.post("/pets", 422, @mime)
    |> put_in([:request, :body], pet_params)
    |> assert_schema
  end

  test "Allows creating cats" do
    pet = %Pet{name: "Chauncy", type: "cat"} |> Repo.insert!

    @swagger
    |> Apocryphal.Transaction.get("/pets/{id}", 200, @mime)
    |> put_in([:request, :path_params], %{"id" => pet.id})
    |> assert_schema
  end

  test "[GET] /pets/{id} (404)" do
    @swagger
    |> Apocryphal.Transaction.get("/pets/{id}", 404, @mime)
    |> put_in([:request, :path_params], %{"id" => "-1"})
    |> assert_schema
  end
end
