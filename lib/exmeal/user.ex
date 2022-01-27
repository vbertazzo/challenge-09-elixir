defmodule Exmeal.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Exmeal.Meal

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:cpf, :email, :name]

  @derive {Jason.Encoder, only: [:cpf, :id, :email, :name]}

  schema "users" do
    field :name, :string
    field :cpf, :string
    field :email, :string

    has_many :meals, Meal

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_params()
  end

  def changeset(struct, params) do
    struct
    |> cast(params, @required_params)
    |> validate_params()
  end

  defp validate_params(struct) do
    struct
    |> validate_required(@required_params)
    |> validate_format(:email, ~r/@/)
    |> validate_length(:cpf, is: 11)
    |> unique_constraint([:email])
    |> unique_constraint([:cpf])
  end
end
