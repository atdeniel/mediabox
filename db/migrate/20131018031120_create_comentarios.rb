class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
		t.string  :coment
		t.integer :nivel
		t.string  :notificacion
		t.integer :fk_album
		t.integer :fk_usuario
		t.integer :fk_comentario
      t.timestamps
    end
  end
end
