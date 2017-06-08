defmodule BallotBox.Repo.Migrations.CreateVotes do
  use Ecto.Migration

  def change do
    create table(:votes) do
      add :user_id, references(:accounts_users, on_delete: :delete_all)
      add :topic_id, references(:topics, on_delete: :delete_all)
    end
 
    create unique_index(:votes, [:user_id, :topic_id])
    create index(:votes, [:topic_id])
  end
end
