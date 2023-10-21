defmodule Restaurant.OrderItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "order_items" do
    field :quantity, :integer
    field :amount, :decimal
    field :order_uuid, :id
    field :menu_item_id, :id

    timestamps()
  end

  @doc false
  def changeset(order_item, attrs) do
    order_item
    |> cast(attrs, [:quantity, :amount])
    |> validate_required([:quantity, :amount])
  end
end
