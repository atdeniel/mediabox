class CreateMultimedia < ActiveRecord::Migration
  def change
    create_table :multimedia do |t|
		t.string  :nombre
		t.date    :fecha
		t.string  :descripcion
		t.string  :lugar
		t.string  :api
		t.string  :tipo
		t.integer :fk_album
		t.string  :activo
      t.timestamps
    end
  end
end
