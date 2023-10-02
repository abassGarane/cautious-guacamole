defmodule RestaurantWeb.Router do
  use RestaurantWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {RestaurantWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", RestaurantWeb do
    pipe_through :browser

    get "/", PageController, :home

    get "/dashboard", DashboardController, :index
    get "/settings", SettingsController, :index
    get "/orders", OrdersController, :index
    get "/analytics", AnalyticsController, :index
    get "/reports", ReportsController, :index
    get "/history", HistoryController, :index
    live "/dashboard/history", HistoryLive
    live "/dashboard/profile", ProfileLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", RestaurantWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:restaurant, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: RestaurantWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
