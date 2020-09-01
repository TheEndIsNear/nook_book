defmodule NookBook.Table.Behaviour do
  @callback table_name() :: atom()
  @callback table_type() :: atom()
  @callback table_fields() :: [atom()]
  @callback table_indexes() :: [atom()]
end
