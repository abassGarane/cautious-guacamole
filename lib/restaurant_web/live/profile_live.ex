defmodule RestaurantWeb.ProfileLive do
  use RestaurantWeb, :live_view

  def mount(_params, _session, socket) do
    socket = assign(socket, :count, 10)
    {:ok, socket}
  end

  # def render(assigns) do
  #   ~L"""
  #   <h1> History Page </h1>
  #   """
  # end

  def on_change() do
  end
end
