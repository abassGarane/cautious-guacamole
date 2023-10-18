defmodule Restaurant.Order do
  use Ecto.Schema
  import Ecto.Changeset
  alias Restaurant.Accounts.{User}

  @primary_key {:uuid, :binary_id, autogenerate: true}

  schema "orders" do
    field :status, :string
    timestamps()
    belongs_to :user, User
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [:status])
    |> validate_required([:status])
  end
end
