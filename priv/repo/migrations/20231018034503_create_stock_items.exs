defmodule Restaurant.Repo.Migrations.CreateStockItems do
  use Ecto.Migration

  def change do
    create table(:stock_items) do
      add :name, :string
      add :quantity, :string
      add :bp, :decimal
      add :supplier_id, references(:suppliers, on_delete: :nothing)
      add :status, :string

      timestamps()
    end

    create index(:stock_items, [:supplier_id])
  end
end
