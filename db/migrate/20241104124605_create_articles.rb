class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      # Aqui deve estar a linha para o status se você quiser
      t.string :status  # Adicione esta linha se não estiver presente
      t.timestamps
    end
  end
end
