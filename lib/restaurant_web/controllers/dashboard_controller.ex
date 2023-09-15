defmodule RestaurantWeb.DashboardController do
  use RestaurantWeb, :controller

  def settings(conn, _params) do
    conn
    |>render(:settings)
  end

  def index(conn, _params) do
    render(conn, :index)
  end
end
