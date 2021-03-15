defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "User",
      email: "test@test.com",
      cpf: "123456",
      age: 22,
      address: "Street"
    }
  end

  def item_factory do
    %Item{
      description: "Pizza",
      category: :pizza,
      unity_price: Decimal.new("45.5"),
      quantity: 1
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Street",
      items: [
        build(:item),
        build(:item,
          description: "Another descripton",
          category: :hamburguer,
          quantity: 2,
          unity_price: Decimal.new("20.00")
        )
      ],
      total_price: Decimal.new("85.50"),
      user_cpf: "123456"
    }
  end
end
