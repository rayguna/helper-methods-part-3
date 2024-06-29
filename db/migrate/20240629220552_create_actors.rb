class CreateActors < ActiveRecord::Migration[7.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.date :dob
      t.string :bio
      t.string :text

      t.timestamps
    end
  end
end
