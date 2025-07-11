class ProdutosController < ApplicationController
  before_action :set_produto, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  after_action :verify_authorized, except: %i[index]
  after_action :verify_policy_scoped, only: %i[index]
  def index
    @categorias = Categoria.all
    @mostrar_botoes = true

    @produtos = policy_scope(Produto)

    if params[:categoria_id].present?
      @produtos = @produtos.where(categoria_id: params[:categoria_id])
    end

    if params[:nome].present?
      @produtos = @produtos.where("nome ILIKE ?", "%#{params[:nome]}%")
    end

    if params[:preco_min].present?
      @produtos = @produtos.where("preco >= ?", params[:preco_min])
    end

    if params[:preco_max].present?
      @produtos = @produtos.where("preco <= ?", params[:preco_max])
    end

    if params[:somente_disponiveis] == "1"
      @produtos = @produtos.where("estoque > 0")
    end
  end

  def show
    authorize @produto
  end

  def new
    @produto = Produto.new
    authorize @produto
  end

  def create
    @produto = Produto.new(produto_params)
    authorize @produto
    @produto.user = current_user

    if @produto.save
      redirect_to @produto, notice: "Produto criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @produto
  end

  def update
    authorize @produto
    if @produto.update(produto_params)
      redirect_to @produto, notice: "Produto atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @produto
    @produto.destroy!
    redirect_to produtos_path, status: :see_other, notice: "Produto excluído com sucesso!"
  end

  private

  def set_produto
  @produto = Produto.find(params[:id])
  authorize @produto
  end

  def produto_params
    params.require(:produto).permit(:nome, :descricao, :preco, :estoque, :imagem)
  end
end
