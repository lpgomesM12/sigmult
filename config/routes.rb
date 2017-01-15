Rails.application.routes.draw do
  resources :lancamentos
  resources :caixas
  resources :codvendas
  resources :codclientes
  resources :itenvendas
  resources :vendas
  resources :telefoneclientes
  resources :clientes
  resources :categoriafinaceiros
  resources :tipomovifinanceiros
  resources :formapagamentos
  resources :contabanks
  resources :unidademedidas
  resources :fornecedors
  resources :estoques
  resources :movimentacaoprodutos
  resources :produtos
  devise_for :users
  resources :categoriaprodutos
  resources :empresas
  resources :enderecos
  resources :cidades
  resources :estados
  resources :categoriaempresas
  get 'static_pages/home'
  get 'buscafornecedor' => 'fornecedors#busca'
  get 'buscaproduto' => 'produtos#busca'
  get 'pdv' => 'vendas#pdv'
  root 'static_pages#home'

  match '/buscaitenvenda', to: 'itenvendas#busca_iten_venda', via: 'get'
  match '/entradaEstoque', to: 'movimentacaoprodutos#entrada', via: 'get'
  match '/saidaEstoque', to: 'movimentacaoprodutos#saida', via: 'get'
  match '/listarCidade', to: 'cidades#get_cities', via: 'get'
  match '/criarVenda', to: 'vendas#criar_venda', via: 'get'
  match '/incluiItemVenda', to: 'itenvendas#add_item_venda', via: 'get'
  match '/alterarItemVenda', to: 'itenvendas#atualizar_item_venda', via: 'get'
  match '/buscaItensVenda', to: 'itenvendas#busca_itens_venda', via: 'get'
  match '/buscaVenda', to: 'vendas#busca_venda', via: 'get'
  match '/cancelaVenda', to: 'vendas#cancela_venda', via: 'get'
  match '/caixaAberto', to: 'caixas#caixa_aberto', via: 'get'
  match '/fecharCaixa', to: 'caixas#fechar_caixa', via: 'get'
  match '/finalizaVenda', to: 'vendas#finalizar_venda', via: 'get'
  match '/buscalancamento', to: 'lancamentos#lancamentos', via: 'get'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
