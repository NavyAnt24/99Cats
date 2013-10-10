Cats99::Application.routes.draw do
  resources :cats do
    collection do
      resources :cat_rental_requests, only: [:new, :create]
    end
    resources :cat_rental_requests, :only => [:index, :show, :destroy]
  end

end
