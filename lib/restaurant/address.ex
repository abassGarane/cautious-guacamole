defmodule Restaurant.Address do
  use Ecto.Schema

  embedded_schema do
    field :country, :string
    field :city, :string
    field :street, :string
    field :postal_address, :string
  end
end
