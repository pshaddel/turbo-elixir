defmodule Discuss.TestController do
  use Discuss.Web, :controller

  def main(conn, _params) do
    render(conn, "index.html")
  end
end
