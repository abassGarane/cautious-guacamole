defmodule RestaurantWeb.CreateOrder do
  use RestaurantWeb, :live_component

  def render(assigns) do
    ~H"""
    <div>
      <button class="font-semibold text-xl text-blue-600" phx-click={show_modal("create_order")}>Create Order</button>
      <.modal id="create_order" >
        <h1>Create Order</h1>
        <.simple_form for={%{}} as={:order} phx-target={@myself} phx-submit="create_order"> 
          <.input name={:items} value={nil} placeholder="Create Order" type="textarea" />
          <.button type="submit"> Add Comment </.button>
        </.simple_form>
        <!-- <button class="font-semibold text-xl text-blue-600" phx-click={hide_modal("create_order")}> Close </button> -->
      </.modal>
    </div>
    """
  end

  def handle_event("create_order", %{"order" => order} = _params, socket) do
    IO.inspect(order)
    {:noreply, socket}
  end
end
