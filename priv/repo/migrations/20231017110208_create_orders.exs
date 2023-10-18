defmodule Restaurant.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :status, :string
      add :total, :decimal
      timestamps()

      add :user_id, references(:users, on_delete: :nothing)
    end

    create index(:orders, [:user_id])
  end
end
