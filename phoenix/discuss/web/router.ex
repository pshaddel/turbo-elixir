defmodule Discuss.Router do
  use Discuss.Web, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(Discuss.Plugs.SetUser)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", Discuss do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  # scope "/test", Discuss do
  #   # Use the default browser stack
  #   pipe_through(:browser)

  #   get("/", TestController, :main)
  # end

  scope "/topics", Discuss do
    pipe_through(:browser)
    # get("/", TopicController, :index)
    # get("/new", TopicController, :new)
    # get("/:id/edit", TopicController, :edit)
    # post("/", TopicController, :create)
    # put("/:id", TopicController, :update)
    # delete("/:id", TopicController, :delete)
    # get("/:id", TopicController, :getById)
    resources("/", TopicController)
  end

  scope "/auth", Discuss do
    pipe_through(:browser)
    # get("/", TopicController, :index)
    # get("/new", TopicController, :new)
    # get("/:id/edit", TopicController, :edit)
    # post("/", TopicController, :create)
    # put("/:id", TopicController, :update)
    # delete("/:id", TopicController, :delete)
    # get("/:id", TopicController, :getById)
    get("/signout", AuthController, :signout)
    get("/:provider", AuthController, :request)
    get("/:provider/callback", AuthController, :callback)
  end
end
