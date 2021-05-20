defmodule PruebaparksWeb.ParkControllerTest do
  use PruebaparksWeb.ConnCase

  alias Pruebaparks.Accounts

  @create_attrs %{address: "some address", description: "some description", name: "some name", size: 42, status: 42}
  @update_attrs %{address: "some updated address", description: "some updated description", name: "some updated name", size: 43, status: 43}
  @invalid_attrs %{address: nil, description: nil, name: nil, size: nil, status: nil}

  def fixture(:park) do
    {:ok, park} = Accounts.create_park(@create_attrs)
    park
  end

  describe "index" do
    test "lists all parks", %{conn: conn} do
      conn = get(conn, Routes.park_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Parks"
    end
  end

  describe "new park" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.park_path(conn, :new))
      assert html_response(conn, 200) =~ "New Park"
    end
  end

  describe "create park" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.park_path(conn, :create), park: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.park_path(conn, :show, id)

      conn = get(conn, Routes.park_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Park"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.park_path(conn, :create), park: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Park"
    end
  end

  describe "edit park" do
    setup [:create_park]

    test "renders form for editing chosen park", %{conn: conn, park: park} do
      conn = get(conn, Routes.park_path(conn, :edit, park))
      assert html_response(conn, 200) =~ "Edit Park"
    end
  end

  describe "update park" do
    setup [:create_park]

    test "redirects when data is valid", %{conn: conn, park: park} do
      conn = put(conn, Routes.park_path(conn, :update, park), park: @update_attrs)
      assert redirected_to(conn) == Routes.park_path(conn, :show, park)

      conn = get(conn, Routes.park_path(conn, :show, park))
      assert html_response(conn, 200) =~ "some updated address"
    end

    test "renders errors when data is invalid", %{conn: conn, park: park} do
      conn = put(conn, Routes.park_path(conn, :update, park), park: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Park"
    end
  end

  describe "delete park" do
    setup [:create_park]

    test "deletes chosen park", %{conn: conn, park: park} do
      conn = delete(conn, Routes.park_path(conn, :delete, park))
      assert redirected_to(conn) == Routes.park_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.park_path(conn, :show, park))
      end
    end
  end

  defp create_park(_) do
    park = fixture(:park)
    {:ok, park: park}
  end
end
