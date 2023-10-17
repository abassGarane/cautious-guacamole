defmodule Restaurant.Repo.Migrations.AddAddressesEmbededUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :addresses, {:array, :map}, default: []
    end
  end
end
