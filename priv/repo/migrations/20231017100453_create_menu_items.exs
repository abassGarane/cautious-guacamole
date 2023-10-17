defmodule Restaurant.Repo.Migrations.CreateMenuItems do
  use Ecto.Migration

  def change do
    create table(:menu_items) do
      add :name, :string
      add :description, :text
      add :price, :decimal
      add :images_url, {:array, :string}

      timestamps()
    end

    create index(:menu_items, :price)
    create index(:menu_items, :name)
  end
end
