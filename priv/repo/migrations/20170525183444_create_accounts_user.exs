defmodule BallotBox.Repo.Migrations.CreateBallotBox.Accounts.User do
  use Ecto.Migration

  def change do
    create table(:accounts_users) do
      add :name, :string
      add :email, :string
      add :avatar, :string
      add :uid, :string
      add :provider, :string

      timestamps()
    end

    create unique_index(:accounts_users, [:provider, :uid])

  end
end
