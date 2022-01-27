defmodule ExmealWeb.UsersController do
  use ExmealWeb, :controller
  alias Exmeal.User
  alias ExmealWeb.FallbackController

  action_fallback FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Exmeal.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  def delete(conn, %{"id" => id}) do
    with {:ok, _user} <- Exmeal.delete_user(id) do
      conn
      |> put_status(:no_content)
      |> text("")
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- Exmeal.get_user_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def index(conn, params) do
    with {:ok, users} <- Exmeal.get_all_users() do
      conn
      |> put_status(:ok)
      |> render("index.json", users: users)
    end
  end

  @spec update :: nil
  def update() do
    # TO DO
  end
end
