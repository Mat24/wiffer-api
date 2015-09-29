Rails.application.routes.draw do
  namespace :api do
    put 'user/update'
    post 'user/create'
    post 'user/login'
  end
end
