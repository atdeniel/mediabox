class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
		t.string  :nombre
		t.date    :fecha
		t.string  :descripcion
		t.string  :lugar
		t.string  :imagen
		t.string  :privacidad
		t.integer :fk_usuario
		t.string  :activo
		t.string  :playalbum
      t.timestamps
    end
  end
end
