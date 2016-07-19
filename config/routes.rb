Rails.application.routes.draw do
  resources :loans, defaults: {format: :json} do
    resources :payments, only: [:index, :create, :show], defaults: {format: :json}
  end
  # "Expose endpoints for [...] seeing an individual payment"
  # I'm not sure if this implies that the payment exposuse should be nested within the loan resource, so I did both
  resources :payments, only: [:show]
end
