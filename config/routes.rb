Spree::Core::Engine.routes.draw do
  namespace :api, defaults: { format: 'json' } do
    resources :line_items, only: [] do
      resources :customizations, only: [:update]
    end
  end
end
