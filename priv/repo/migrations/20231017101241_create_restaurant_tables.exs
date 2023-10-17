defmodule Restaurant.Repo.Migrations.CreateRestaurantTables do
  use Ecto.Migration

  def change do
    create table(:restaurant_tables) do
      add :status, :string
      add :number_of_chairs, :integer
      add :name, :string

      timestamps()
    end
  end
end
