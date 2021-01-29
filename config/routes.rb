Rails.application.routes.draw do
  root 'products#index'
  post '/upload', to: 'products#upload_csv'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
