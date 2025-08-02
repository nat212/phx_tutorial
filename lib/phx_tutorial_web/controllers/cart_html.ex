defmodule PhxTutorialWeb.CartHTML do
  use PhxTutorialWeb, :html

  alias PhxTutorial.ShoppingCart

  embed_templates "cart_html/*"

  def currency_to_str(%Decimal{} = val), do: "R#{Decimal.round(val, 2)}"
end
