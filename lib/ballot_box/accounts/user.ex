defmodule BallotBox.Accounts.User do
  use Ecto.Schema

  schema "accounts_users" do
    field :avatar, :string
    field :email, :string
    field :name, :string
    field :provider, :string
    field :uid, :string

    has_many :topics, BallotBox.Suggestion.Topic, foreign_key: :owner_id

    timestamps()
  end
end
