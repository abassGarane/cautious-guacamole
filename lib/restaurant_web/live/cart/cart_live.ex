defmodule RestaurantWeb.CartLive do
  use RestaurantWeb, :live_view

  def mount(_params, _session, socket) do
    items = [
      %{
        img_url: "https://google.com",
        price: 45,
        color: "blue",
        name: "Jacket",
        quantity: 1,
        total: 45
      },
      %{
        img_url: "https://google.com",
        price: 45,
        color: "blue",
        name: "Jacket",
        quantity: 1,
        total: 45
      }
    ]

    {:ok, assign(socket, :items, items)}
  end

  def cart_item(assigns) do
    ~H"""
    <tr class=" bg-white border-b  dark:bg-gray-800 dark:border-gray-700">
      <th
        scope="row"
        class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white space-x-2"
      >
        <div class="flex flex-row items-center space-x-4">
         <img src={@item.img_url}  class="h-full"/>
        <div class="flex flex-col space-y-2">
        <h4 class="font-semibold text-lg"> <%= @item.name %> </h4>
        <p class="text-gray-600 text-md"> <%= @item.color %> </p>
        </div>
        </div>
      </th>
      <td class="px-6 py-4 font-semibold">$<%= @item.price %></td>
      <td class="px-6 py-4">
        <div class="flex flex-row items-center space-x-4 bg-gray-200 rounded-full shadow py-2 px-4 justify-between">
          <button class="bg-gray-200 font-bold text-xl"> - </button>
          <p> <%= @item.quantity %> </p>
          <button class="bg-gray-200 font-bold text-2xl"> + </button>
        </div>
      </td>
      <td class="px-6 py-4">$<%= @item.total %></td>
      <td class="px-6 py-4">
        <button> x </button>
      </td>
    </tr>

    """
  end

  def order_summary(assigns) do
    ~H"""
    <div>
    <div class="bg-gray-300  flex flex-col space-y-4 mt-10 rounded-sm">
      <h2 class="border-b border-gray-400 border-offset-4 text-gray-900 p-4">Order Summary </h2>
      <div class="flex flex-col space-y-2 border-b border-gray-400 w-full p-4" >
        <div class="flex flex-row justify-between">
          <p class="text-gray-600"> Subtotal </p>
          <strong> $418 </strong>
        </div>
        <div class="flex flex-row justify-between">
          <p class="text-gray-500"> Shipping </p>
          <strong> Free </strong>
        </div>
        <.link navigate={~p"/"} class="text-green-500 font-semibold text-md flex flex-row items-center justify-start">
          <p> Add Coupon Code </p>
          <small class="text-2xl font-semibold text-center">&rarr;</small>
        </.link>
      </div>
      <div class="flex flex-row justify-between p-4 items-center">
        <h3> Total </h3>
        <strong> $569 </strong>
      </div>
      </div>
      <button class="w-full bg-green-500 p-4 font-semibold text-center text-white text-md mt-4"> Checkout </button>
    </div>
    """
  end
end
