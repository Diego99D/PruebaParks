defmodule Pruebaparks.Accounts.Park do
  use Ecto.Schema
  import Ecto.Changeset

  schema "parks" do
    field :address, :string
    field :description, :string
    field :name, :string
    field :size, :integer
    field :status, :integer

    timestamps()
  end

  @doc false
  def changeset(park, attrs) do
    park
    |> cast(attrs, [:name, :address, :description, :size, :status])
    |> validate_required([:name, :address, :description, :size, :status])
  end
end
