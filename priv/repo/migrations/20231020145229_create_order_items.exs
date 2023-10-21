defmodule Restaurant.Repo.Migrations.CreateOrderItems do
  use Ecto.Migration

  def change do
    create table(:order_items) do
      add :quantity, :integer
      add :amount, :decimal
      add :order_uuid, references(:orders, on_delete: :nothing)
      add :menu_item_id, references(:menu_items, on_delete: :nothing)

      timestamps()
    end

    create index(:order_items, [:order_uuid])
    create index(:order_items, [:menu_item_id])
  end
end
