defmodule Pruebaparks.Repo.Migrations.CreateParks do
  use Ecto.Migration

  def change do
    create table(:parks) do
      add :name, :string
      add :address, :string
      add :description, :string
      add :size, :integer
      add :status, :integer

      timestamps()
    end

  end
end
