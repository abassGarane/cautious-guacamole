defmodule Restaurant.StockItem do
  alias Restaurant.Supplier
  use Ecto.Schema
  import Ecto.Changeset

  schema "stock_items" do
    field :name, :string
    field :quantity, :string
    field :bp, :decimal
    field :status, Ecto.Enum, values: [:in_stock, :out_of_stock]
    belongs_to :supplier, Supplier

    timestamps()
  end

  @doc false
  def changeset(stock_item, attrs) do
    stock_item
    |> cast(attrs, [:name, :quantity, :bp])
    |> validate_required([:name, :quantity, :bp])
  end
end
