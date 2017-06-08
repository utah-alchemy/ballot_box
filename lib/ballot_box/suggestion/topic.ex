defmodule BallotBox.Suggestion.Topic do
  use Ecto.Schema

  alias BallotBox.Accounts

  schema "topics" do
    field :description, :string
    field :title, :string
    belongs_to :owner, Accounts.User
    many_to_many :votes, Accounts.User, join_through: "votes"

    timestamps()
  end
end
