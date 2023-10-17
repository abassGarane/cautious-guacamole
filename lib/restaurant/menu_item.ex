defmodule Restaurant.MenuItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "menu_items" do
    field :name, :string
    field :description, :string
    field :price, :decimal
    field :images_url, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(menu_item, attrs) do
    menu_item
    |> cast(attrs, [:name, :description, :price, :images_url])
    |> validate_required([:name, :description, :price, :images_url])
  end
end
