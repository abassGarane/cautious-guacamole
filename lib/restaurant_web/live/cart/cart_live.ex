defmodule RestaurantWeb.CartLive do
  use RestaurantWeb, :live_view

  @items [
    %{
      img_url:
        "https://media.istockphoto.com/id/1342121693/photo/blue-sport-winter-jacket-isolated-on-white-warm-clothes.jpg?s=1024x1024&w=is&k=20&c=4FXMnl-VJmnVp99QAXPfxwKtni8J1weKYO6rvuOg5zs=",
      price: 45,
      color: "blue",
      name: "Jacket",
      quantity: 1,
      total: 45
    },
    %{
      img_url:
        "https://media.istockphoto.com/id/1342121693/photo/blue-sport-winter-jacket-isolated-on-white-warm-clothes.jpg?s=1024x1024&w=is&k=20&c=4FXMnl-VJmnVp99QAXPfxwKtni8J1weKYO6rvuOg5zs=",
      price: 45,
      color: "blue",
      name: "Jacket",
      quantity: 1,
      total: 45
    },
    %{
      img_url:
        "https://media.istockphoto.com/id/525220922/photo/blank-white-socks-design-mockup-isolated-clipping-path.jpg?s=612x612&w=0&k=20&c=nPIeabCqTOJPjh59E3eYFV1TJ8t7BccQb59B9EACdKo=",
      price: 67,
      color: "yellow",
      name: "Socks",
      quantity: 90,
      total: 97.88
    }
  ]

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :items, @items)}
  end

  def cart_item(assigns) do
    ~H"""
    <tr class=" bg-white border-b  dark:bg-gray-800 dark:border-gray-700 rounded">
      <th
        scope="row"
        class="px-6 py-4 font-medium text-gray-900 whitespace-nowrap dark:text-white space-x-2"
      >
        <div class="flex flex-row items-center space-x-4">
         <img src={@item.img_url}  class="w-32 h-32"/>
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
          <button class="bg-gray-200 font-bold text-2xl" phx-click="increase_quantity" value={@item.name <> "/" <> to_string(@item.quantity)}> + </button>
        </div>
      </td>
      <td class="px-6 py-4">$<%= @item.quantity * @item.price %></td>
      <td class="px-6 py-4">
        <button> x </button>
      </td>
    </tr>

    """
  end

  def items_here do
    @items
  end

  def order_summary(assigns) do
    ~H"""
    <div class="">
    <div class="bg-blue-200 opacity-90 shadow  flex flex-col space-y-4 mt-10 rounded-sm">
      <h2 class="border-b border-gray-400 border-offset-4 text-gray-900 p-4">Order Summary </h2>
      <div class="flex flex-col space-y-2 border-b border-gray-400 w-full p-4" >
        <div class="flex flex-row justify-between">
          <p class="text-gray-600"> Subtotal </p>
          <strong> $<%= total_amount() %> </strong>
        </div>
        <div class="flex flex-row justify-between">
          <p class="text-gray-500"> Shipping </p>
          <strong> Free </strong>
        </div>
        <div class="text-green-500 font-semibold text-md flex flex-row items-center justify-start">
          <button phx-click={show_modal("add-coupon")}> Add Coupon Code </button>
          <.add_coupon />
          <small class="text-2xl font-semibold text-center">&rarr;</small>
        </div>
      </div>
      <div class="flex flex-row justify-between p-4 items-center">
        <h3> Total </h3>
        <strong>$<%= total_amount() %></strong>
      </div>
      </div>
      <button class="w-full bg-green-500 p-4 font-semibold text-center text-white text-md mt-4" phx-click="remove_item"> Checkout </button>
    </div>
    """
  end

  def add_coupon(assigns) do
    ~H"""
    <.modal id="add-coupon" show={true} >
    <div class="flex flex-col space-y-4">
      <.header> Validate Coupon </.header>
      <.simple_form for={%{}} as={:coupon}  phx-submit="validate_coupon">
        <.input type="text" label="Please input the coupon code here" value={nil} name="coupn_code" />
        <.button type="submit" > Validate </.button>
      </.simple_form>
      </div>

    </.modal>
    """
  end

  def handle_event("validate_coupon", %{"coupon_code" => coupon_code} = _params, socket) do
    IO.puts(coupon_code)

    if coupon_code != nil and coupon_code != "" do
      IO.inspect(coupon_code)
      {:ok, push_navigate(socket, to: ~p"/dashboard")}
    end

    {:noreply, socket}
  end

  def handle_event("increase_quantity", _params, socket) do
    {:noreply, socket}
  end

  def total_amount() do
    Enum.reduce(@items, 0, fn item, acc -> item.price * item.quantity + acc end)
  end
end
