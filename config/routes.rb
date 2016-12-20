Rails.application.routes.draw do
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

  root 'static_pages#home'

  match '/entradaEstoque', to: 'movimentacaoprodutos#entrada', via: 'get'
  match '/saidaEstoque', to: 'movimentacaoprodutos#saida', via: 'get'
  match '/listarCidade', to: 'cidades#get_cities', via: 'get'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end