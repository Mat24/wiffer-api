Rails.application.routes.draw do
  namespace :api, defaults: {format: :json} do
    put 'user/update'
    post 'user/create'
    post 'user/login'

    resources :networks, except: [:new, :edit]
  end
end
