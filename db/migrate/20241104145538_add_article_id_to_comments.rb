class AddArticleIdToComments < ActiveRecord::Migration[8.0]
  def change
    add_column :comments, :article_id, :integer
    add_index :comments, :article_id  # Adiciona um índice para melhor desempenho em buscas
  end
end
