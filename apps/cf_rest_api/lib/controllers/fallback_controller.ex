defmodule CF.RestApi.FallbackController do
  @moduledoc """
  Translates controller action results into valid `Plug.Conn` responses.

  See `Phoenix.Controller.action_fallback/1` for more details.
  """
  use CF.RestApi, :controller

  alias CF.Accounts.UserPermissions.PermissionsError

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(CF.RestApi.ChangesetView, "error.json", changeset: changeset)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(404)
    |> render(CF.RestApi.ErrorView, "error.json", message: "not_found")
  end

  def call(conn, {:error, %PermissionsError{}}) do
    conn
    |> put_status(403)
    |> render(CF.RestApi.ErrorView, :"403")
  end
end
