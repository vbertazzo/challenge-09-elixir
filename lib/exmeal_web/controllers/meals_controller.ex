defmodule ExmealWeb.MealsController do
  use ExmealWeb, :controller
  alias Exmeal.Meal
  alias ExmealWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %Meal{} = meal} <- Exmeal.create_meal(params) do
      conn
      |> put_status(:created)
      |> render("create.json", meal: meal)
    end
  end

  def delete() do
    # TO DO
  end

  def show() do
    # TO DO
  end

  def update() do
    # TO DO
  end
end
