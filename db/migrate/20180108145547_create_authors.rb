class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.string :city
      t.string :address
      t.date :birth_date

      t.timestamps
    end
  end
end
