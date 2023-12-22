defmodule ElixirIpsumWeb.TextController do
  use ElixirIpsumWeb, :controller

  def index(conn, _params) do
    json(conn, %{text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce gravida leo tortor, quis mattis nibh molestie nec. Fusce faucibus sodales tempus. Vestibulum gravida placerat metus eget volutpat. Maecenas pellentesque tellus nec turpis convallis, nec iaculis sem elementum. Maecenas vitae orci odio. Praesent iaculis urna sit amet elementum interdum. Phasellus dignissim purus felis, non condimentum erat consectetur nec. In blandit neque est, id lobortis arcu porttitor nec. Praesent dui erat, vestibulum sit amet suscipit fermentum, molestie et justo."})
  end
end
