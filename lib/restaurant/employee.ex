defmodule Restaurant.Employee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "employees" do
    field :role, :string
    field :gender, :string
    field :hourly_wage, :decimal
    field :weekly_hours, :decimal
    belongs_to :user, Restaurant.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:role, :gender, :hourly_wage, :weekly_hours])
    |> validate_required([:role, :gender, :hourly_wage, :weekly_hours])
  end
end
