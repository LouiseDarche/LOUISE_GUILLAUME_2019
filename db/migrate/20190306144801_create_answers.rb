class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :name
      t.string :email
      t.boolean :answer_dinner
      t.boolean :answer_brunch
      t.integer :nb_dinner
      t.integer :nb_brunch

      t.timestamps
    end
  end
end
