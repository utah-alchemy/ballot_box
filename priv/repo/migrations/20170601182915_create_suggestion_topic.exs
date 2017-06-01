defmodule BallotBox.Repo.Migrations.CreateBallotBox.Suggestion.Topic do
  use Ecto.Migration

  def change do
    create table(:topics) do
      add :title, :string
      add :description, :text
      add :owner_id, references(:accounts_users, on_delete: :nothing)

      timestamps()
    end

    create index(:topics, [:owner_id])
  end
end
