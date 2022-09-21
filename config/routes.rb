Rails.application.routes.draw do
  root to: "pages#home"
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create]
  end
  # resources bookmarks:, only: :destroy
end
