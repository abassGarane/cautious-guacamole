defmodule Restaurant.Payment do
  use Ecto.Schema
  import Ecto.Changeset
  alias Restaurant.Accounts.User

  schema "payments" do
    field :status, :string
    field :type, Ecto.Enum, values: [:cash, :card, :mpesa]
    field :amount, :decimal
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(payment, attrs) do
    payment
    |> cast(attrs, [:type, :status, :amount])
    |> validate_required([:type, :status, :amount])
  end
end
