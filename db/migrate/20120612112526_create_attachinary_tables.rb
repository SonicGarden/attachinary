class CreateAttachinaryTables < ActiveRecord::Migration[5.2]
  def change
    create_table :attachinary_files do |t|
      t.references :attachinariable, polymorphic: true, index: {name: "index_attachinary_files_attachinariable"}
      t.string :scope

      t.string :public_id
      t.string :version
      t.integer :width
      t.integer :height
      t.string :format
      t.string :resource_type
      t.timestamps
      t.integer :sort
    end
    add_index :attachinary_files, [:attachinariable_type, :attachinariable_id, :scope], name: 'by_scoped_parent'
  end
end
