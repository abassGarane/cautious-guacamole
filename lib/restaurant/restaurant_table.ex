defmodule Restaurant.RestaurantTable do
  use Ecto.Schema
  import Ecto.Changeset

  schema "restaurant_tables" do
    field :name, :string
    field :status, Ecto.Enum, values: [:reserved, :occupied, :free]
    field :number_of_chairs, :integer

    timestamps()
  end

  @doc false
  def changeset(restaurant_table, attrs) do
    restaurant_table
    |> cast(attrs, [:status, :number_of_chairs, :name])
    |> validate_required([:status, :number_of_chairs, :name])
  end
end
