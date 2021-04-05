defmodule Mealcon.User do
  use Ecto.Schema

  import Ecto.Changeset

  alias Mealcon.Meal

  @primary_key {:id, :binary_id, autogenerate: true}

  @required_params [:name, :cpf, :email]

  @derive {Jason.Encoder, only: [:id, :name, :cpf, :email]}

  schema "users" do
    field :name, :string
    field :cpf, :string
    field :email, :string

    has_many :meals, Meal
    timestamps()
  end

  def changeset(struct \\ %__MODULE__{}, params) do
    struct
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
