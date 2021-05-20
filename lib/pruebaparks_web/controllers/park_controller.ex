defmodule PruebaparksWeb.ParkController do
  use PruebaparksWeb, :controller

  alias Pruebaparks.Accounts
  alias Pruebaparks.Accounts.Park

  def index(conn, _params) do
    parks = Accounts.list_parks()
    render(conn, "index.html", parks: parks)
  end

  def new(conn, _params) do
    changeset = Accounts.change_park(%Park{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"park" => park_params}) do
    case Accounts.create_park(park_params) do
      {:ok, park} ->
        conn
        |> put_flash(:info, "Park created successfully.")
        |> redirect(to: Routes.park_path(conn, :show, park))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    park = Accounts.get_park!(id)
    render(conn, "show.html", park: park)
  end

  def edit(conn, %{"id" => id}) do
    park = Accounts.get_park!(id)
    changeset = Accounts.change_park(park)
    render(conn, "edit.html", park: park, changeset: changeset)
  end

  def update(conn, %{"id" => id, "park" => park_params}) do
    park = Accounts.get_park!(id)

    case Accounts.update_park(park, park_params) do
      {:ok, park} ->
        conn
        |> put_flash(:info, "Park updated successfully.")
        |> redirect(to: Routes.park_path(conn, :show, park))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", park: park, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    park = Accounts.get_park!(id)
    {:ok, _park} = Accounts.delete_park(park)

    conn
    |> put_flash(:info, "Park deleted successfully.")
    |> redirect(to: Routes.park_path(conn, :index))
  end
end
