defmodule RestaurantWeb.ProfileLive do
  use RestaurantWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :count, 10)
    {:ok, socket}
  end
end
