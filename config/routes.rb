Rails.application.routes.draw do
  # Define a rota raiz ("/")
  root 'articles#index' # Tornando o index a página principal

  # Rotas para autenticação de usuários (se você estiver usando o Devise, descomente a linha abaixo)
  # devise_for :users

  # Rotas para usuários, permitindo apenas as ações new e create
  resources :users, only: [:new, :create]

  # Rotas para artigos e comentários aninhados
  resources :articles do
    resources :comments, only: [:create, :destroy] # Especifica as ações permitidas para comentários
    #resources :comments
  end

  # Verificação de status da aplicação (retorna 200 se a aplicação estiver funcionando)
  # get "up" => "rails/health#show", as: :rails_health_check

  # Renderização dinâmica de arquivos PWA a partir de app/views/pwa/*
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker"

  # Outras rotas podem ser adicionadas abaixo conforme necessário
end
