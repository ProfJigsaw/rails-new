Rails.application.routes.draw do
  resources :achievements, only: %i[create new]

  root to: 'welcome#index'
end
