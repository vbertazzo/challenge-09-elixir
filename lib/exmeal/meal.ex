defmodule Exmeal.Meal do
  use Ecto.Schema
  import Ecto.Changeset
  alias Exmeal.User

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  @required_params [:description, :date, :calories, :user_id]
  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "meals" do
    field :description, :string
    field :date, :date
    field :calories, :integer

    belongs_to :user, User

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
    |> foreign_key_constraint(:user_id)
    |> validate_length(:description, min: 6)
    |> validate_number(:calories, greater_than: 0)
  end
end
