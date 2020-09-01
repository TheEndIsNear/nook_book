import Config

name = "matt"

config :nook_book, NookBookWeb.Endpoint,
  server: true,
  http: [port: 4000],
  url: [host: "#{name}.nookbook.online"],
  secret_key_base: "08Gm1PGaG2HVAj+Jp1wnbVHLCabyigRvQwWhfYbQhesoNKzCRxR9pWMsyPpHKJ20"

  config :libcluster,
  topologies: [
    nook_book: [
      strategy: Cluster.Strategy.Epmd,
      config: [
        hosts: [
          :"nook_book@10.0.1.231",
          :"nook_book@10.0.1.65"
        ]
      ]
    ]
  ]

config :nook_book,
  cluster_role: System.get_env("CLUSTER_ROLE", "member") |> String.to_atom(),
  base_uri: "http://#{name}.nookbook.online"
