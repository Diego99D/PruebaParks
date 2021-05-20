defmodule Pruebaparks.AccountsTest do
  use Pruebaparks.DataCase

  alias Pruebaparks.Accounts

  describe "parks" do
    alias Pruebaparks.Accounts.Park

    @valid_attrs %{address: "some address", description: "some description", name: "some name", size: 42, status: 42}
    @update_attrs %{address: "some updated address", description: "some updated description", name: "some updated name", size: 43, status: 43}
    @invalid_attrs %{address: nil, description: nil, name: nil, size: nil, status: nil}

    def park_fixture(attrs \\ %{}) do
      {:ok, park} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_park()

      park
    end

    test "list_parks/0 returns all parks" do
      park = park_fixture()
      assert Accounts.list_parks() == [park]
    end

    test "get_park!/1 returns the park with given id" do
      park = park_fixture()
      assert Accounts.get_park!(park.id) == park
    end

    test "create_park/1 with valid data creates a park" do
      assert {:ok, %Park{} = park} = Accounts.create_park(@valid_attrs)
      assert park.address == "some address"
      assert park.description == "some description"
      assert park.name == "some name"
      assert park.size == 42
      assert park.status == 42
    end

    test "create_park/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_park(@invalid_attrs)
    end

    test "update_park/2 with valid data updates the park" do
      park = park_fixture()
      assert {:ok, %Park{} = park} = Accounts.update_park(park, @update_attrs)
      assert park.address == "some updated address"
      assert park.description == "some updated description"
      assert park.name == "some updated name"
      assert park.size == 43
      assert park.status == 43
    end

    test "update_park/2 with invalid data returns error changeset" do
      park = park_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_park(park, @invalid_attrs)
      assert park == Accounts.get_park!(park.id)
    end

    test "delete_park/1 deletes the park" do
      park = park_fixture()
      assert {:ok, %Park{}} = Accounts.delete_park(park)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_park!(park.id) end
    end

    test "change_park/1 returns a park changeset" do
      park = park_fixture()
      assert %Ecto.Changeset{} = Accounts.change_park(park)
    end
  end
end
