# PetStore

This app is a demo of using [Apocryphal](http://github.com/coryodaniel/apocryphal) with Phoenix
```
brew install postgres

# configuring postgres account
createuser petz --superuser

mix deps.get
mix ecto.setup
mix phoenix.server
```

## Generate Swagger tests
```
mix apocryphal.init
```

Parse swagger documentation into ExUnit tests

```bash
mix apocryphal.gen.test V1.Pets --only=^\/pets --swagger-file=./docs/pet_store.yml
mix apocryphal.gen.test V1.Stores --only=^\/stores --swagger-file=./docs/pet_store.yml
```

"One big file" mode:

```bash
mix apocryphal.gen.test V1.PetAPI --swagger-file=./docs/pet_store.yml
```

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
