defmodule RssHerder.User do
  use RssHerder.Web, :model
  use Coherence.Schema

  schema "users" do
    field :username, :string
    field :email, :string
    coherence_schema

    timestamps
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:username, :email] ++ coherence_fields)
    |> validate_required([:username, :email])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> validate_coherence(params)
  end
end
