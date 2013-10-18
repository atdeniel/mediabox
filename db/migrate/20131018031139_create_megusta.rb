class CreateMegusta < ActiveRecord::Migration
  def change
    create_table :megusta do |t|
		t.string  :tipo
		t.integer :fk_usuario
		t.integer :fk_comentario
      t.timestamps
    end
  end
end
