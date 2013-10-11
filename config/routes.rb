Cats99::Application.routes.draw do
  resources :cats do
    collection do
      resources :cat_rental_requests, only: [:new, :create]
    end
  end

  resources :cat_rental_requests, :only => [] do
    member do
      post "/approve" => "CatRentalRequests#approve"
      post "/deny" => "CatRentalRequests#deny"
    end
  end

end
