Rails.application.routes.draw do
  resources :loans, defaults: {format: :json}, only: [:index, :show]

  resources :loans do
    resources :payments, only: [:index, :show, :new, :create], defaults: {format: :json}
  end
end
