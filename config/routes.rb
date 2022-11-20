Rails.application.routes.draw do
  post "sign_up", to: "users#create"
  get "sign_up", to: "users#new"

  root to: "users#new"
end
