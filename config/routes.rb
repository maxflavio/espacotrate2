Rails.application.routes.draw do
  get 'admin/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'admin/index'
  root 'admin#index'

  resources :patients
  resources :comments
  resources :receipts

  get '/comments/new/:nr_cpf', action: :new, controller: 'comments'
  get '/vizualizar_comentarios/:nr_cpf', action: :index, controller: 'comments'

    #get '/gerar_recigo/:nr_cpf', action: :new, controller: 'receipts'



end
