class ArticlesController < ApplicationController
  # Autenticação básica para proteger ações específicas
  http_basic_authenticate_with name: "meick", password: "123456", except: [:index, :show]

  # Ação para listar todos os artigos
  def index
    @articles = Article.includes(:comments).all # Inclui os comentários para evitar N+1 queries
  end

  # Ação para exibir um artigo específico
  def show
    @article = Article.find_by(id: params[:id]) # Tenta encontrar o artigo pelo ID

    if @article.nil?
      flash[:alert] = "Artigo não encontrado." # Exibe uma mensagem se o artigo não for encontrado
      redirect_to articles_path
    else
      Rails.logger.info "Artigo encontrado: #{@article.inspect}" # Log para debugging
      @comments = @article.comments # Carrega os comentários do artigo
      @comment = @article.comments.build # Inicializa um novo comentário para o formulário
    end
  end

  # Ação para exibir o formulário de criação de artigo
  def new
    @article = Article.new
  end

  # Ação para criar um novo artigo
  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article, notice: 'Artigo criado com sucesso.'
    else
      flash.now[:alert] = @article.errors.full_messages.to_sentence # Mostra mensagens de erro na criação
      render :new, status: :unprocessable_entity
    end
  end

  # Ação para exibir o formulário de edição de artigo
  def edit
    @article = Article.find(params[:id])
    @comment = @article.comments.new # Inicializa um novo comentário para o formulário
  end

  # Ação para atualizar um artigo existente
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article, notice: 'Artigo atualizado com sucesso.'
    else
      flash.now[:alert] = @article.errors.full_messages.to_sentence # Mostra mensagens de erro na atualização
      render :edit, status: :unprocessable_entity
    end
  end

  # Ação para excluir um artigo
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, status: :see_other, notice: 'Artigo excluído com sucesso.'
  end

  private

  # Apenas permite parâmetros específicos para segurança
  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
