class CreateMunicipes < ActiveRecord::Migration[6.0]
  def change
    create_table :municipes do |t|
      t.string :full_name
      t.string :cpf
      t.date :birthdate
      t.string :phone
      t.string :email
      t.boolean :status

      t.timestamps
    end
  end
end
