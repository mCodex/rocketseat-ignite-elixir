defmodule Mealcon.Repo.Migrations.AlterTableMealsToAddUserId do
  use Ecto.Migration

  def change do
    alter table(:meals) do
      add :user_id, references(:users)
    end
  end
end
