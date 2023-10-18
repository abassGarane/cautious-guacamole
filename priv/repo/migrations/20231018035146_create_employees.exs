defmodule Restaurant.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :role, :string
      add :gender, :string
      add :hourly_wage, :decimal
      add :weekly_hours, :decimal
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:employees, [:user_id])
  end
end
