defmodule RestaurantWeb.HistoryController do
  use RestaurantWeb, :controller


  def index(conn, _params) do
    conn
    |> render(:index)
  end
end
