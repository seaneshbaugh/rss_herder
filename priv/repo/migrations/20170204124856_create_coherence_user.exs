defmodule RssHerder.Repo.Migrations.CreateCoherenceUser do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :username, :string
      add :email, :string
      add :role, :string
      # confirmable
      add :confirmation_token, :string
      add :confirmed_at, :datetime
      add :confirmation_sent_at, :datetime
      # authenticatable
      add :password_hash, :string
      # recoverable
      add :reset_password_token, :string
      add :reset_password_sent_at, :datetime
      # lockable
      add :failed_attempts, :integer, default: 0
      add :locked_at, :datetime
      # trackable
      add :sign_in_count, :integer, default: 0
      add :current_sign_in_at, :datetime
      add :last_sign_in_at, :datetime
      add :current_sign_in_ip, :string
      add :last_sign_in_ip, :string
      # unlockable_with_token
      add :unlock_token, :string

      timestamps()
    end

    create unique_index(:users, [:username])
    create unique_index(:users, [:email])
    create index(:users, [:role])
  end
end
