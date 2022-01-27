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

  def show(conn, %{"id" => id}) do
    with {:ok, %Meal{} = meal} <- Exmeal.get_meal_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("meal.json", meal: meal)
    end
  end

  def index(conn, params) do
    with {:ok, meals} <- Exmeal.get_all_meals() do
      conn
      |> put_status(:ok)
      |> render("index.json", meals: meals)
    end
  end

  def update() do
    # TO DO
  end
end
