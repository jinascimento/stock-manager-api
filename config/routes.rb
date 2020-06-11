Rails.application.routes.draw do
  api_version(module: 'V1', path: {value: 'v1'}) do
    resources :stores do
      resources :stock_items, module: :stores do
        member do
          put 'add_units'
          put 'remove_units'
        end
      end
    end
    resources :products
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
