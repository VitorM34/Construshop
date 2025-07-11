require 'rails_helper'

RSpec.describe ProdutosController, type: :controller do
  describe 'GET #index' do
     it 'retorna um sucesso ao acessar a lista de produtos' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'renderiza a view index' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'atribui @produtos' do
      produto = Produto.create(nome: 'Produto Teste', preco: 10.0)
      get :index
      expect(assigns(:produtos)).to include(produto)
    end
  end
end
