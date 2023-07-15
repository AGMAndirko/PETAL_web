defmodule Bm.Repo.Migrations.CreateAds do
  use Ecto.Migration

  def change do
    create table(:ads) do
      add :location, :string
      add :name, :string
      add :instrument, :string
      add :genre, :string

      timestamps()
    end
  end
end
