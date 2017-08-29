defmodule CaptainFactWeb.StatementController do
  use CaptainFactWeb, :controller

  alias CaptainFactWeb.{Statement}
  alias CaptainFact.Comments.Comment

  def get(conn, %{"video_id" => video_id}) do
    video_id = CaptainFact.VideoHashId.decode!(video_id)
    statements = Repo.all from statement in Statement,
      left_join: speaker in assoc(statement, :speaker),
      where: statement.video_id == ^video_id,
      where: statement.is_removed == false,
      order_by: statement.time,
      preload: [:speaker, comments: ^(Comment.full(Comment, true))]

    render(conn, "index_full.json", statements: statements)
  end
end