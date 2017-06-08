defmodule BallotBox.Accounts.User do
  use Ecto.Schema

  schema "accounts_users" do
    field :avatar, :string
    field :email, :string
    field :name, :string
    field :provider, :string
    field :uid, :string

    has_many :topics, BallotBox.Suggestion.Topic, foreign_key: :owner_id
    many_to_many :voted_topics, BallotBox.Suggestion.Topic, join_through: "votes"

    timestamps()
  end
end
