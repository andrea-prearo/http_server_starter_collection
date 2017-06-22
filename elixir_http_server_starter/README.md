# Elixir HTTP Server Starter

A minimalistic Elixir HTTP server app using [Cowboy](https://github.com/ninenines/cowboy),
[Plug](https://github.com/elixir-lang/plug) and [Poison](https://github.com/devinus/poison).

## Running locally

Make sure you have [Elixir](http://elixir-lang.org/) installed.
The code has been developed and tested using `Elixir 1.4.4`.

```sh
git clone git@github.com:andrea-prearo/http_server_starter_collection.git
cd http_server_starter_collection/elixir_http_server_starter
mix deps.get
iex -S mix
```

Your app should now be running on [localhost:4000](http://localhost:4000).

You can terminate the app by pressing `Ctrl+C` and then `a`.
