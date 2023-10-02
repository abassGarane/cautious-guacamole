defmodule RestaurantWeb.HistoryLive do
  use RestaurantWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :count, 10)
    {:ok, socket}
  end
  def on_change() do
  end
end
