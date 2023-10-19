defmodule RestaurantWeb.Dashboard.ChartHelpers do
  use RestaurantWeb, :live_component

  def render(assigns) do
    ~H"""
    <svg>
      <.draw_monoline />
    </svg>
    """
  end

  def draw_monoline(assigns) do
    ~H"""
    <polyline 
      phx.click={JS.push("show-tooltip", values: %{x: 331, y: 150, value: 18000})}
      points={"#{@line.startX},#{@line.startY} #{@line.endX},#{@line.endY}"}
      stroke="black"
      class="stroke-indigo-700 stroke-[3] [stroke-linecap:round] [stroke-opacity:0.50]"
      />
    <.tooltip if={@tooltip} x={@tooltip.x} y={@tooltip.y} value={@tooltip.value} />
    """
  end

  def tooltip(assigns) do
    ~H"""
    tooltip
    """
  end

  # defp calculate_line_coordinates(number_of_sales, [previous_line | _], chart) do
  #   current_line_start_x = previous_line.line_end_x
  #   current_line_start_y = previous_line.line_end_y
  # end

  attr :class, :string,
    default: "fill-slate-600 text-sm font-semibold [dominant-baseline:hanging] [text-anchor:end] "

  attr :x, :integer, required: true
  attr :y, :integer, required: true
  attr :value, :string, required: true

  defp chart_legend(assigns) do
    ~H"""
    <text x={@x} y={@y} class={@class}><%= @value %> </text>
    """
  end
end
