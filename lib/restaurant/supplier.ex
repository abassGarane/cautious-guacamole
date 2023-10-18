defmodule Restaurant.Supplier do
  use Ecto.Schema
  import Ecto.Changeset
  alias Restaurant.StockItem

  schema "suppliers" do
    field :name, :string
    field :email, :string
    field :phone_number, :string

    has_many :stock_items, StockItem

    timestamps()
  end

  @doc false
  def changeset(supplier, attrs) do
    supplier
    |> cast(attrs, [:name, :email, :phone_number])
    |> validate_required([:name, :email, :phone_number])
  end
end
