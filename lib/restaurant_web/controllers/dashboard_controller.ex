defmodule RestaurantWeb.DashboardController do
  use RestaurantWeb, :controller

  def settings(conn, _params) do
    conn
    |> render(:settings)
  end

  def clarity(%{"name" => name}) do
    IO.puts name
  end


  def index(conn, _params) do
    # |> put_flash(:info, "here is your first flash")
    conn
    |> render(:index)
  end
end
