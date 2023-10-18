defmodule Restaurant.Repo.Migrations.CreatePayments do
  use Ecto.Migration

  def change do
    create table(:payments) do
      add :type, :string
      add :status, :string
      add :amount, :decimal

      timestamps()
    end
  end
end
