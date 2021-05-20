defmodule Pruebaparks.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Pruebaparks.Repo

  alias Pruebaparks.Accounts.Park

  @doc """
  Returns the list of parks.

  ## Examples

      iex> list_parks()
      [%Park{}, ...]

  """
  def list_parks do
    Repo.all(Park)
  end

  @doc """
  Gets a single park.

  Raises `Ecto.NoResultsError` if the Park does not exist.

  ## Examples

      iex> get_park!(123)
      %Park{}

      iex> get_park!(456)
      ** (Ecto.NoResultsError)

  """
  def get_park!(id), do: Repo.get!(Park, id)

  @doc """
  Creates a park.

  ## Examples

      iex> create_park(%{field: value})
      {:ok, %Park{}}

      iex> create_park(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_park(attrs \\ %{}) do
    %Park{}
    |> Park.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a park.

  ## Examples

      iex> update_park(park, %{field: new_value})
      {:ok, %Park{}}

      iex> update_park(park, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_park(%Park{} = park, attrs) do
    park
    |> Park.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a park.

  ## Examples

      iex> delete_park(park)
      {:ok, %Park{}}

      iex> delete_park(park)
      {:error, %Ecto.Changeset{}}

  """
  def delete_park(%Park{} = park) do
    Repo.delete(park)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking park changes.

  ## Examples

      iex> change_park(park)
      %Ecto.Changeset{source: %Park{}}

  """
  def change_park(%Park{} = park) do
    Park.changeset(park, %{})
  end
end
