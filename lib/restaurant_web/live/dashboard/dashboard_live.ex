defmodule RestaurantWeb.DashboardLive do
  use RestaurantWeb, :live_view

  def chart(assigns) do
    ~H"""
          <!-- <rect 
        <svg viewBox="0 0 200 80" xmlns="http://www.w3.org/2000/svg">
          <!-- <rect -->
          <!--   x="0" -->
          <!--   y="0" -->
          <!--   width="100%" -->
          <!--   height="100%" -->
          <!--   fill="blue" -->
          <!--   stroke="yellow" -->
          <!--   stroke-width="4" -->
          <!-- /> -->
          <!-- <polyline points="0,80 50,0 60,60 70,0 120,80" file="none" stroke="blue" /> -->
          <!-- <text x="100" y="30" font-size="16px">Hello abass</text> -->
       <!-- </svg> -->
    """
  end
end
