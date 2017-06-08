defmodule BallotBox.Suggestion do
  @moduledoc """
  The boundary for the Suggestion system.
  """

  import Ecto.{Query, Changeset}, warn: false
  alias BallotBox.Repo
  alias BallotBox.Accounts.User
  alias BallotBox.Suggestion.Topic

  @doc """
  Returns the list of topics.

  ## Examples

      iex> list_topics()
      [%Topic{}, ...]

  """
  def list_topics do
    Repo.all(Topic)
  end

  @doc """
  Gets a single topic.

  Raises `Ecto.NoResultsError` if the Topic does not exist.

  ## Examples

      iex> get_topic!(123)
      %Topic{}

      iex> get_topic!(456)
      ** (Ecto.NoResultsError)

  """
  def get_topic!(id), do: Repo.get!(Topic, id)

  @doc """
  Creates a topic.

  ## Examples

      iex> create_topic(%{field: value})
      {:ok, %Topic{}}

      iex> create_topic(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_topic(attrs \\ %{}, %User{} = user) do
    %Topic{}
    |> topic_changeset(attrs)
    |> Ecto.Changeset.put_assoc(:owner, user)
    |> Repo.insert()
  end

  @doc """
  Updates a topic.

  ## Examples

      iex> update_topic(topic, %{field: new_value})
      {:ok, %Topic{}}

      iex> update_topic(topic, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_topic(%Topic{} = topic, attrs) do
    topic
    |> topic_changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Topic.

  ## Examples

      iex> delete_topic(topic)
      {:ok, %Topic{}}

      iex> delete_topic(topic)
      {:error, %Ecto.Changeset{}}

  """
  def delete_topic(%Topic{} = topic) do
    Repo.delete(topic)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking topic changes.

  ## Examples

      iex> change_topic(topic)
      %Ecto.Changeset{source: %Topic{}}

  """
  def change_topic(%Topic{} = topic) do
    topic_changeset(topic, %{})
  end

  def upvote_topic(%Topic{} = topic, %User{} = user) do
    topic
    |> Repo.preload(:votes)
    |> Ecto.Changeset.change
    |> Ecto.Changeset.put_assoc(:votes, [user])
    |> Repo.update()
  end

  defp topic_changeset(%Topic{} = topic, attrs) do
    topic
    |> cast(attrs, [:title, :description])
    |> validate_required([:title])
    |> foreign_key_constraint(:owner_id)
  end
end
