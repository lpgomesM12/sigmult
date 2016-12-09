Rails.application.routes.draw do
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
  root 'static_pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
