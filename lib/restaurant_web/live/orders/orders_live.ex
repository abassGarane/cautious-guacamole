defmodule RestaurantWeb.OrdersLive do
  use RestaurantWeb, :live_view

  def mount(_, _, socket) do
    {:ok, assign(socket, :items, [1, 2, 3, 4])}
  end
end
