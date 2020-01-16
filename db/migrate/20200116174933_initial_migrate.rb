class InitialMigrate < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.column(:name, :string)
    end
    create_table :ingredients do |t|
      t.column(:name, :string)
    end
    create_table :recipes do |t|
      t.column(:name, :string)
      t.column(:rating, :int)
      t.column(:description, :string)
    end
    create_table :ingredients_recipes, id: false do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :ingredient, index: true

    end

    create_table :recipes_tags, id: false do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :tag, index: true

    end
  end
end
